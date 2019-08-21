class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    authorize @booking
    @kitty = Kitty.find(params[:kitty_id])
  end

  def show
    authorize @booking
    # @kitty = Kitty.find(params[:kitty_id])
    # @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.kitty = Kitty.find(params[:kitty_id])
    @booking.user = current_user
    # raise
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
    authorize @booking
  end

  def destroy
    @kitty = @booking.kitty
    @booking.destroy
    redirect_to kitty_path(@kitty)
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:end_date,:start_date , :kitty_id, :user_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
