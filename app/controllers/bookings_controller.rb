class BookingsController < ApplicationController
  def show
    @kitty = Kitty.find(params[:kitty_id])
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.boat = Kitty.find(params[:kitty_id])
    @booking.user = current_user
    # raise
    if @kitty.save
      redirect_to kitty_booking_path(@booking.kitty, @booking)
    else
      redirect_to kitty_path(@booking.kitty)
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @kitty = @booking.kitty
    @booking.destroy
    redirect_to kitty_path(@kitty)
  end

  private

  def booking_params
    params.require(:booking).permit(:price, :kitty_id, :user_id)
  end
end
