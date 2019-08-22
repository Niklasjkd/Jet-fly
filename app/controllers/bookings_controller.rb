class BookingsController < ApplicationController
  before_action :set_user, only: [:new, :create, :index, :show, :destroy]

  def index
    @bookings = Booking.where(user_id: @user.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @plane = Plane.find_by(id: params[:plane_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to plane_bookings_path(@user)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to plane_bookings_path
  end

  private

  def booking_params
    params.permit(:destination, :plane_id, :user_id, :start_date)
  end

end
