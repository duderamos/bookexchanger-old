# Bookexchanger

It is an app that people can announce books they want to donate or exchange.

(in progress)

## Some Gems 

### carrierwave + mini_magick

Implements uploader feature with image manipulation.

### coffee-rails

CoffeeScript is a great language that simplifies JavaScript scripts.

### devise

Sign up, sign in and other authentication stuff made easy.

### haml-rails

Haml turns views more readable and clear.

### sidekiq

ActiveJob backend. Very nice to run background jobs and async mailer.

### unicorn

Rack HTTP server for rails.

### capybara

Integration testing tool.

### factory_girl_rails + faker

Random data generation in testings.

### rspec-rails

Testing framework.

## Web proxy

Nginx use as front-end web proxy. Configuration guide here https://www.digitalocean.com/community/tutorials/how-to-deploy-rails-apps-using-unicorn-and-nginx-on-centos-6-5

## Dependency

### Redis

A running redis instance is needed by sidekiq.

## Instalation

      bundle install
      bundle exec rake db:migrate
      bundle exec rake db:seed

## Configuration

Set the ``default from`` of the mailer in ``app/mailers/application_mailer.rb``.

Change the default mailer sender of devise in ``config/initializers/devise.rb``.

## Running

      bundle exec sidekiq
      bundle exec unicorn -D -c config/unicorn.rb
