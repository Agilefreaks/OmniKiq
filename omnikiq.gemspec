Gem::Specification.new do |s|
  s.name        = 'omnikiq'
  s.version     = '0.1.2'
  s.date        = '2014-12-12'
  s.summary     = 'Integrate mixpanel and sidekiq in your ruby app'
  s.description = 'A gem used to defer posts to mixpanel in a background worker.'
  s.authors     = ['Adrian Nistor', 'Alexandru Calinoiu']
  s.email       = 'nistor.adrian@agilefreaks.com'
  s.homepage    = 'https://github.com/Agilefreaks/OmniKiq'
  s.license     = '© 2015 Omnipaste'

  s.files = `git ls-files -- lib/*`.split("\n") if Dir.exist?('.git')
  s.test_files = `git ls-files -- spec/*`.split("\n") if Dir.exist?('.git')
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 2.1.5'

  s.add_dependency 'mixpanel-ruby', '~> 1'
  s.add_dependency 'sidekiq', '~> 3'

  s.add_development_dependency 'rake', '~> 10'
  s.add_development_dependency 'rspec', '~> 3'
  s.add_development_dependency 'rspec-its', '~> 1'
end
