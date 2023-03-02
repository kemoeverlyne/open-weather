class WeatherController < ApplicationController
  require 'uri'
  require 'net/http'

  def index
    @all_country = CS.countries
  end

  def create
    city_name = params[:city_name]
    api_code = ['API_CODE']
    api = "https://api.openweathermap.org/data/2.5/weather?q=#{city_name}&appid=#{api_code}&units=metric"
    if api
      uri = URI(api)
      res = Net::HTTP.get_response(uri)
      if res.is_a?(Net::HTTPSuccess)
        url_status = res.body
        redirect_to weather_show_path(api_status: url_status)
      else
        redirect_to weather_show_path(), :notice => "Data not found! Try again"
      end
    else
      redirect_to root_path, :notice => "City can not be found!"
    end
  end

  def show
    if params[:api_status].present?
      _status = JSON.parse(params[:api_status])
      @api_status = {
        :name => _status['name'],
        :coord => _status['coord'],
        :weather => _status['weather'],
        :main => _status['main'],
        :visibility => _status['visibility'],
        :wind => _status['wind'],
        :clouds => _status['clouds'],
        :sys => _status['sys'],
        :timezone => _status['timezone']
      }
    end
  end
end
