require 'json'
require 'open-uri'

class PlanesController < ApplicationController
  before_action :set_user, only: [:index, :show]
  def index
    if params[:location].present?
      @planes = Plane.where(location: params[:location])
    else
      @planes = Plane.all
    end
  end

  def show
    @plane = Plane.find(params[:id])
    fetch_api(@plane.location, params[:destination])
    @markers = [{
      lat: @plane.lat,
      lng: @plane.long,
      infoWindow: render_to_string(partial: "info_window_map", locals: { name: @plane.location, place_type: "Origin" })
    }]
  end

  private

  def fetch_api(origin, destination)
    url = "https://www.distance24.org/route.json?stops=#{origin}|#{destination}"
    data_serialized = open(url).read
    data = JSON.parse(data_serialized)
    calc_time_and_cost(data["distance"])
  end

  def calc_time_and_cost(distance_in_kilo)
    # 0,15832 flight time in min for 1 kilometer
    @flight_time_in_min = distance_in_kilo * 0.15832
    @flight_time_in_hours = @flight_time_in_min / 60
    @flight_cost = @flight_time_in_min * @plane.price_per_min
    @total_cost = @flight_cost + @plane.base_price
  end
end
