Gem::Specification.new do |s|
  s.name        = 'omnikiq'
  s.version     = '0.0.1'
  s.date        = '2014-12-12'
  s.summary     = 'Integrate mixpanel and sidekiq in your ruby app'
  s.description = 'A gem used to defer posts to mixpanel in a background worker.'
  s.authors     = ['Adrian Nistor', 'Alexandru Calinoiu']
  s.email       = 'levelboy@gmail.com'
  s.homepage    = 'https://github.com/Agilefreaks/OmniKiq'
  s.license     = '© 2015 Omnipaste'

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 2.1.5'

  s.add_dependency 'mixpanel-ruby', '~> 0'
  s.add_dependency 'sidekiq', '~> 0'
end