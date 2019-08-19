class KittiesController < ApplicationController
  before_action :set_kitty, only: [:show, :edit, :update, :destroy]

  def index
    @kitties = Kitty.all
  end

  def show
  end

  def new
    @kitty = Kitty.new
  end

  def edit
  end

  def create
    @kitty = Kitty.new(kitty_params)

    respond_to do |format|
      if @kitty.save
        format.html { redirect_to @kitty, notice: 'Kitty was successfully created.' }
        format.json { render :show, status: :created, public_key: @kitty }
      else
        format.html { render :new }
        format.json { render json: @kitty.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @kitty.update(kitty_params)
        format.html { redirect_to @kitty, notice: 'Kitty was successfully updated.' }
        format.json { render :show, status: :ok, public_key: @kitty }
      else
        format.html { render :edit }
        format.json { render json: @kitty.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @kitty.destroy
    respond_to do |format|
      format.html { redirect_to kitties_url, notice: 'Kitty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_kitty
    @kitty = Kitty.find(params[:id])
  end

  def kitty_params
    params.require(:kitty).permit(:first_name, :last_name)
  end
end
