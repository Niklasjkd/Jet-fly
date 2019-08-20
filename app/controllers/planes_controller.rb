class PlanesController < ApplicationController
  before_action :set_user, only: [:index, :show]
  def index
    @planes = Plane.all
  end

  def show
    @plane = Plane.find(params[:id])
  end
end
