class KittiesController < ApplicationController
  before_action :set_kitty, only: [:show, :edit, :update, :destroy]

  def index
    @kitties = policy_scope(Kitty)
    # raise
    # plus convention probleme : small recap ?
    # @kitties = Kitty.all
    # attention julien convention de nommage ici
    # singulier pour garder coherence avec dhh
    @kitty = Kitty.geocoded #returns flats with coordinates

    @markers = @kitty.map do |kitty|
      {
        lat: kitty.latitude,
        lng: kitty.longitude
      }
    end
  end

  def new
    @kitty = Kitty.new
    authorize @kitty
  end

  def show
    # here need to add the booking stuff
    # it will be on the show page !!
    # @booking = Booking.new
    authorize @kitty
    # raise
    @markers =
      [{
        lat: @kitty.latitude,
        lng: @kitty.longitude
      }]

      # temp
      @kitties = policy_scope(Kitty)
      authorize @kitties
  end

  def edit
    authorize @kitty
  end

  def create
    @kitty = Kitty.new(kitty_params)
    @kitty.owner = current_user
    # raise
    authorize @kitty
    if @kitty.save
      redirect_to kitty_path(@kitty)
    else
      render :new
    end
  end

  def update
    authorize @kitty

    if @kitty.update(kitty_params)
      redirect_to @kitty
    else
      render :edit
    end
    # @kitty.update(kitty_params)
    # if @kitty.save!
    #   redirect_to kitty_path(@kitty)
    # else
    #   render :edit
    # end
  end

  def destroy
    authorize @kitty
    @kitty.destroy
    redirect_to kitties_path
  end

  private

  def set_kitty
    @kitty = Kitty.find(params[:id].to_i)
  end

  def kitty_params
    params.require(:kitty).permit(:first_name, :last_name, :public_key, :price, :address)
  end
end
