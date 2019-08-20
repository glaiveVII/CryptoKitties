class KittiesController < ApplicationController
  before_action :set_kitty, only: [:show, :edit, :update, :destroy]

  def new
    @kitty = Kitty.new
  end

  def index
    @kitty = Kitty.all
    # plus convention probleme : small recap ?
    # @kitties = Kitty.all
  end

  def show
  end

  def edit
  end

  def create
    @kitty = Kitty.new(kitty_params)
    @kitty.owner = current_user
    if @kitty.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @kitty.update(kitty_params)
    if @kitty.save!
      redirect_to kitty_path(@kitty)
    else
      render :edit
    end
  end

  def destroy
    @kitty.destroy
    redirect_to root_path
  end

  private

  def set_kitty
    @kitty = Kitty.find(params[:id].to_i)
  end

  def kitty_params
    params.require(:kitty).permit(:first_name, :last_name, :public_key)
  end
end
