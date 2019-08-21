class PagesController < ApplicationController
  before_action :set_user, only: [:home]
  skip_before_action :authenticate_user!, only: [:home]

  def home
      redirect_to planes_path(search_params) if search_params.present?
  end

private

  def search_params
    params.permit(:location, :destination, :date)
  end
end
