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
The following endpoints are exposed in the application:
⭐ `GET /api/v1/forecast?location=city,state`
* User can input a location as query param (ex: Littleton,CO) and receive the following weather data in response:
```ruby
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-08-09T23:14:58.000-06:00",
                "sunrise": "2022-08-09T06:06:52.000-06:00",
                "sunset": "2022-08-09T20:04:20.000-06:00",
                "temperature": 75.38,
                "feels_like": 74.68,
                "humidity": 44,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "few clouds",
                "icon": "02n"
            },
            "daily_weather": [
                {
                    "date": "2022-08-09 1:00:00-0600",
                    "sunrise": "2022-08-09 6:06:52-0600",
                    "sunset": "2022-08-09 8:04:20-0600",
                    "max_temp": 91.81,
                    "min_temp": 67.84,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                ...
            ],
            "hourly_weather": [
                {
                    "time": "23:00:00",
                    "temperature": 75.38,
                    "conditions": "few clouds",
                    "icon": "02n"
                },
                {
                    "time": "00:00:00",
                    "temperature": 74.95,
                    "conditions": "few clouds",
                    "icon": "02n"
                },
               ...
                }
            ]
        }
    }
}
```
⭐ `POST /api/v1/users`
User can send a new email, password, and password confirmation in the request body to register, and a successul response as follows will save new user to the database:
```ruby
{
    "data": {
        "type": "users",
        "id": 13,
        "attributes": {
            "email": "casey@eternalpancakes.com",
            "api_key": "unique_user_api_key"
        }
    }
}
```
⭐ `POST /api/v1/sessions`
Once a user has successfully registered, they are able to login with their email and password, send in the request body. The response returns a stored user's email and api key:
```ruby
{
    "data": {
        "type": "users",
        "id": 13,
        "attributes": {
            "email": "casey@eternalpancakes.com",
            "api_key": "unique_user_api_key"
        }
    }
}
```
⭐ `POST /api/v1/road_trip`
This endpoint allows a registered user with an api key to plan a road trip, and accepts an origin, a destination, and their api key in the request body.  The response returns the road trip starting and ending city, the travel time, and the forecast at the destination when the user will be arriving.
```ruby
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Littleton,CO",
            "end_city": "miami,fl",
            "travel_time": "30:15:40"
            "weather_at_eta": {
              "temperature": 76.9,
               "conditions": "scattered clouds"
             }
        }
    }
}
