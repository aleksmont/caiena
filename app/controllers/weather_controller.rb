class WeatherController < ApplicationController
  def index
    begin
      params.require(:city)

      api_weather = OpenWeatherMap::API.new(ENV['weather_api_key'], 'pt', 'metric')

      weather = api_weather.forecast(params[:city])

      # Twitter
      config = {
        consumer_key: ENV['twitter_consumer_key'],
        consumer_secret: ENV['twitter_consumer_secret'],
        access_token: ENV['twitter_access_token'],
        access_token_secret: ENV['twitter_access_token_secret']
      }

      client = Twitter::REST::Client.new(config)

      client.update("Segundo as estimativas metereológicas, contamos com #{weather.forecast.first.temperature}°C e #{weather.forecast.first.description} em #{weather.city.name}.")

      render json: { message: "Your Tweet message was successfully sent" }
    rescue ActionController::ParameterMissing
      render :json => { message: "Missing parameter 'city'" }, :status => :unprocessable_entity
    rescue OpenWeatherMap::Exceptions::UnknownLocation
      render :json => { message: "Unknown Location with the value of parameter 'city'" }, :status => :unprocessable_entity
    rescue Exception
      render :json => { message: "An error occurred. Your twitter message was not sent." }, :status => :internal_server_error
      raise
    end
  end
end
