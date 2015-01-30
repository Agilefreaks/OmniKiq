require 'bundler'

ENV['RACK_ENV'] ||= 'development'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

if ENV['RACK_ENV'] == 'development' || ENV['RACK_ENV'] == 'test'
  require 'rspec/core'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec) do |spec|
    # do not run integration tests, doesn't work on TravisCI
    spec.pattern = FileList['spec/app/*_spec.rb']
  end

  require 'rubocop/rake_task'
  RuboCop::RakeTask.new(:rubocop)

  task default: [:rubocop, :spec]
end
