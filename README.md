### Weather App using OpenWeather API

This is a web application built with Ruby on Rails that allows users to get current weather information for any city around the world using the OpenWeather API.

### Features

1. Users can search for weather information for any city around the world
2. The application displays the current temperature, weather conditions, and a brief description of the weather for the given location
3. Users can view the temperature in either Celsius or Fahrenheit
4. Users can sign up and log in to save their favorite locations for quick access

### Built With

Ruby 2.7.2
Ruby on Rails 6.1.3.1
PostgreSQL 13.2
Docker
OpenWeather API

### Prerequisites

Docker and Docker Compose installed on your machine
OpenWeather API key. You can get one by signing up here

### Getting Started

1. clone this repository

```
git clone https://github.com/kemoeverlyne/open-weather.git
```

2. change directory into the project directory

```
cd weather-app-using-OpenWeather-api
```

3. create a .env file in your project root and set openWeather API key

```
OPEN_WEATHER_API_KEY=your_api_key_here
```

4. Build and run the Docker containers with

```
docker-compose up --build
```

5. Navigate to http://localhost:3000 on your web browser to access the application

### Usage

- Enter a city name in the search bar and click the search button or press enter to display the current weather information for that location
- Click the toggle button to switch between Celsius and Fahrenheit
- Sign up and log in to save your favorite locations
  Usage

### Ackownledgement

- OpenWeather for providing the API
