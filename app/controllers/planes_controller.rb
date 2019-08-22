require 'json'
require 'open-uri'

class PlanesController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:location].present?
      @planes = Plane.where("location ILIKE ?", "%#{params[:location].split.first.gsub(/[\s,]/ ,"")}%")
    elsif params[:owner].present?
      @planes = Plane.where(user_id: params[:owner])
    else
      @planes = Plane.all
    end
  end

  def new
    @plane = Plane.new
  end

  def create
    @plane = Plane.new(plane_params)
    respond_to do |format|
      if @plane.save!
        format.html { redirect_to planes_path(owner: plane_params[:user_id]), notice: 'Plane was successfully created.' }
      else
        render :new
      end
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

  def plane_params
    params.require(:plane).permit(:user_id, :price_per_min, :base_price, :location, :description, :image)
  end

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
    @base_price = spaces_on(@plane.base_price)
    @flight_cost_int = @flight_time_in_min * @plane.price_per_min
    @flight_cost = spaces_on(@flight_cost_int)
    @total_cost = spaces_on(@flight_cost_int + @plane.base_price)
  end

  def spaces_on(number, sep=" ")
    number.round(2).to_s.tap { |s| :go while s.gsub!(/^([^.]*)(\d)(?=(\d{3})+)/, "\\1\\2#{sep}") }
  end
end
