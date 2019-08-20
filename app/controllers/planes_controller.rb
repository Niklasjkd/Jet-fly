class PlanesController < ApplicationController
  def index
    if params[:location].present?
      @planes = Plane.where(location: params[:location])
    else
      @planes = Plane.all
    end
  end

  def show
    @plane = Plane.find(params[:id])
  end
end
