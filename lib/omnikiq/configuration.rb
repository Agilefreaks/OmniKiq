module OmniKiq
  class Configuration
    # Module that holds `attr_reader` declarations. It's in a separate
    # module to allow us to override those methods and use `super`.
    # @private
    READERS = Module.new
    include READERS

    # @private
    def self.define_reader(name)
      READERS.class_eval do
        remove_method name if method_defined?(name)
        attr_reader name
      end
    end

    # @private
    def self.define_aliases(name, alias_name)
      alias_method alias_name, name
      alias_method "#{alias_name}=", "#{name}="
      define_predicate_for alias_name
    end

    # @private
    def self.define_predicate_for(*names)
      names.each { |name| alias_method "#{name}?", name }
    end
    # @private
    #
    # Invoked by the `add_setting` instance method. Use that method on a
    # `Configuration` instance rather than this class method.
    def self.add_setting(name, opts = {})
      attr_writer name
      add_read_only_setting name
      Array(opts[:alias_with]).each do |alias_name|
        define_aliases(name, alias_name)
      end
    end
    # @private
    #
    # As `add_setting` but only add the reader.
    def self.add_read_only_setting(name, _opts = {})
      define_reader name
      define_predicate_for name
    end

    add_setting :mixpanel_api_key
    add_setting :redis_url
    add_setting :redis_namespace
    add_setting :test_mode

    def initialize
      @mixpanel_api_key = ''
      @redis_url = 'redis://localhost:6379'
      @redis_namespace = ENV['RACK_ENV'] || 'default'
      @test_mode = false
    end
  end
end
