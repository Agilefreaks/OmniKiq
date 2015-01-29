# OmniKiq

Background worker for omni using [redis](http://redis.io/), [sidekiq](http://sidekiq.org/).

# Run the sidekiq server

```
bundle exec sidekiq -r './app/server.rb'
```

# Run the sidekiq web monitor

```
rackup
```
