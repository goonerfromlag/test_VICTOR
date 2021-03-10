# QA Test

## This is an application implementing a chat.

- [x] Users must be able to create an account providing a valid email address.
- [x] Once logged in users must be able to send and receive messages.
- [x] It has only one channel/room and all the users subscribed will have access to the only available channel

The system sends to all the users a weekly emails: (see apps/jobs/weekly_stats_job.rb)
- [x] how many messages were sent and received in the last week
- [x] the total number of messages received since the user has sent his last message

# Setup

1. Install ruby 2.7.1
2. `gem install bundler`
3. `bundle install`
4. `cp .env .env.development`
5. `bundle exec rails db:create RAILS_ENV=development`
6. `bundle exec rails db:migrate RAILS_ENV=development`
7. `rails server`


# Dependencies
- redis-server (redis-server must be runing on the default redis port to run sidekiq)

# Run

You need to run 3 processes
1. `rails server`
2. `./bin/webpack-dev-server`
3. `bundle exec sidekiq`

## Development dependencies
- mailcatcher

# Tests

## Setup

1. `cp .env .env.test`
2. `bundle exec rails db:create RAILS_ENV=test`
3. `bundle exec rails db:migrate RAILS_ENV=test`


## Run

1. `bundle exec rspec`
2. `bundle exec rubocop`
