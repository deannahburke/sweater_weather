# Sweater Weather :sunny::snowflake:
API based Rails application built to retrieve weather and forecast data for a given location and timeframe
## Project Learning Goals
* Expose an internal API for *create*, *read*, *update*, and *delete* functionality ⭐⭐⭐
* Consume several external APIs and aggregate specific data from each ⭐⭐⭐
* Manipulate external data to fit fictional front end specifications ⭐⭐⭐
* Test external API consumption and internal API exposure thoroughly and with mocking tools ⭐⭐⭐
## Setup
To set up this project locally, follow these steps:
1. Ensure you have the correct versions of both Ruby (2.7.4 or later) and Rails (5.2.8 or later) by running `ruby -v` and `rails -v` from your command line.
2. This project requires several external API keys, you can register for each for free at the links below.
* [Mapquest API](https://developer.mapquest.com/user/login/sign-up) (same key can be used for both Mapquest endpoints)
* [Openweather API](https://home.openweathermap.org/users/sign_up)
3. Clone the repo:
`git clone git@github.com:deannahburke/sweater_weather.git` &mdash; for SSH
4. Install the following gems using `bundle install` :
```ruby
#global
gem 'bcrypt', '~> 3.1.7'
gem 'figaro'
gem 'faraday'

#section
group :development, :test
  gem 'rspec-rails'
  gem 'pry'
  gem 'shoulda-matchers'
  gem 'simplecov'

#section
group :test
  gem 'webmock'
  gem 'vcr'
```
5. Configure your API keys by running `bundle exec figaro install` in your command line and then pasting each key into the ignored `application.yml` file created by this command:
```ruby
mapquest_api_key: your_mapquest_key_here
openweather_api_key: your_openweather_key_here
```

## Happy Path Endpoint Use
