Gem::Specification.new do |s|
  s.name        = 'mixpanel-sidekiq'
  s.version     = '0.0.4'
  s.date        = '2014-12-12'
  s.summary     = "Integrate mixpanel and sidekiq in your ruby app"
  s.description = "A gem used to defer posts to mixpanel in a background worker."
  s.authors     = ["Adrian Nistor"]
  s.email       = 'levelboy@gmail.com'
  s.files       = %w(lib/extensions/module.rb
                     lib/mixpanel-sidekiq-config.rb
                     lib/mixpanel-sidekiq.rb
                     lib/trackers/mixpanel_events_tracker.rb
                     lib/trackers/mixpanel_alias_tracker.rb
                     lib/trackers/mixpanel_people_tracker.rb)
  s.homepage    =
    'http://rubygems.org/gems/mixpanel-sidekiq'
  s.license       = 'MIT'

  s.add_dependency 'mixpanel-ruby'
  s.add_dependency 'sidekiq'
end