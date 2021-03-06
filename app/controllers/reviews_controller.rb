class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create, :index, :show, :destroy]
  before_action :find_plane, only: [:new, :create]
  before_action :find_booking, only: [:new, :create]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @plane = @booking.plane
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    respond_to do |format|
      if @review.save
        format.html { redirect_to root_path, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to edit_review_registration_path(@review)
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

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
