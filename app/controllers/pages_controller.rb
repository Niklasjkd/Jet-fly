class PagesController < ApplicationController
  before_action :set_user, only: [:home]
  def home
  end
end
