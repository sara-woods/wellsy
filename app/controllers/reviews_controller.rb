class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @session = Session.find(params[:session_id])
  end

  def create
    @review = Review.new(review_params)
    @session = Session.find(params[:session_id])
    @review.session = @session
    @review.user = current_user

    if @review.save
      redirect_to my_bookings_path
    else
      flash[:notice] = "Rating can't be blank" if @review.errors.messages[:rating].first
      flash[:notice] = @review.errors.messages[:session].first if @review.errors.messages[:session].first
      render :new      
    end

  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end