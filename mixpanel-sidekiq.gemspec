Gem::Specification.new do |s|
  s.name        = 'mixpanel-sidekiq'
  s.version     = '0.0.2'
  s.date        = '2014-12-12'
  s.summary     = "Integrate mixpanel and sidekiq in your ruby app"
  s.description = "A gem used to defer posts to mixpanel in a background worker."
  s.authors     = ["Adrian Nistor"]
  s.email       = 'levelboy@gmail.com'
  s.files       = ['lib/extensions/module.rb','lib/mixpanel-sidekiq-config.rb', 'lib/mixpanel-sidekiq.rb', 'lib/mixpanel_events_tracker.rb', 'lib/mixpanel_people_tracker.rb']
  s.homepage    =
    'http://rubygems.org/gems/mixpanel-sidekiq'
  s.license       = 'MIT'

  s.add_dependency 'mixpanel-ruby'
  s.add_dependency 'sidekiq'
end