# README

This README would normally document whatever steps are necessary to get the
application up and running.

# Pre-requisites
  1. Ruby 2.5.3
  2. Rails 6.0.2
  3. Redis server

# Gems
  1. httparty - Http request
  2. rspec and shoulda-matchers - Test
  3. sidekiq - Job background processor

# Install App
  1. bundle install
   
# Configuration
  $ Configure mail strategy in enviroments/development.rb with the strategy to test
  1. SendGrid
    config.mail_strategy = :sengrid 
  2. Mailgun
    config.mail_strategy = :mailgun

# Run
  1. redis-server
  2. bundle exec sidekiq
  2. rails s

# Exceptions
  $ Validations will render a 422 exception
  
# Test
  1. Test with Postman 
  1.1 http://localhost:3000/email with form parameters: email, to_name, from, from_name, subject and body
  2. RSpec
  2.1 rspec spec/models/message_spec.rb --format documentation
  2.2 rspec spec/controllers/messages_controller_spec.rb --format documentation

# Comments
 1. The API keys of Sengrid and Mailgun are in confing/credentials.yml. I will send you config/master.key by email
 2. I should check better the HTTP errors and add errors to a log
 3. Test: add more test for mailers and job classes
  

