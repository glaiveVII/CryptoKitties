class ReviewsController < ApplicationController
  def new
    @kitty = Kitty.find(params[:kitty_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @kitty = Kitty.find(params[:kitty_id])
    @review.kitty = @kitty
    authorize @review
    if @review.save
      redirect_to kitty_path(@kitty)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
