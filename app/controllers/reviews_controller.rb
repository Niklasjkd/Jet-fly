class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :destroy]
  before_action :set_user, only: [:new, :create, :index, :show, :destroy]
  before_action :find_plane, only: [:new, :create]
  before_action :find_booking, only: [:new, :create]
  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to plane_booking_reviews_path
    else
      render :new
    end
  end

  def edit
  end

  # def update
  #   @review.update(review_params)
  #   redirect_to edit_review_registration_path(@review)
  # end

  # def destroy
  #   @review.destroy
  #   redirect_to reviews_path
  # end

  private

  def review_params
    params.require(:review).permit(:booking_id, :content)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def find_plane
    @plane = Plane.find_by(id: params[:plane_id])
  end

  def find_booking
    @booking = Booking.find_by(id: params[:booking_id])
  end
end
