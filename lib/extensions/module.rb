if (!Module.respond_to?('mattr_accessor'))
  class Module
    def mattr_reader(*syms)
      options = extract_options!(syms)
      syms.each do |sym|
        class_eval(<<-EOS, __FILE__, __LINE__ + 1)
          @@#{sym} = nil unless defined? @@#{sym}
          def self.#{sym}
            @@#{sym}
          end
        EOS

        unless options[:instance_reader] == false || options[:instance_accessor] == false
          class_eval(<<-EOS, __FILE__, __LINE__ + 1)
            def #{sym}
              @@#{sym}
            end
          EOS
        end
      end
    end

    def mattr_writer(*syms)
      options = extract_options!(syms)
      syms.each do |sym|
        class_eval(<<-EOS, __FILE__, __LINE__ + 1)
          def self.#{sym}=(obj)
            @@#{sym} = obj
          end
        EOS

        unless options[:instance_writer] == false || options[:instance_accessor] == false
          class_eval(<<-EOS, __FILE__, __LINE__ + 1)
            def #{sym}=(obj)
              @@#{sym} = obj
            end
          EOS
        end
      end
    end

    def mattr_accessor(*syms)
      mattr_reader(*syms)
      mattr_writer(*syms)
    end

    private

    def extract_options!(array)
      if array.last.is_a?(Hash) && array.last.extractable_options?
        array.pop
      else
        {}
      end
    end
  end
end
