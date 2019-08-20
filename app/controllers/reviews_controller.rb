class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new]
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
    @review.save
    redirect_to root_path
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
    params.require(:review).permit(:content, :booking_id)
  end

  def set_review
    @review = review.find(params[:id])
  end
end
