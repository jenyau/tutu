class ReservedCarriagesController < ApplicationController
  before_action :set_reserved_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @reserved_carriages = ReservedCarriage.all
  end

  def show
  end

  def new
    @reserved_carriage = ReservedCarriage.new
  end

  def create
    @reserved_carriage = ReservedCarriage.new(reserved_carriage_params)
    @reserved_carriage.carriage_type = 'reserved_carriage'

    if @reserved_carriage.save
      redirect_to @reserved_carriage
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @reserved_carriage.update(reserved_carriage_params)
      redirect_to @reserved_carriage
    else
      render :edit
    end
  end

  def destroy
    @reserved_carriage.destroy
    redirect_to reserved_carriages_path
  end

  private
  def set_reserved_carriage
    @reserved_carriage = ReservedCarriage.find(params[:id])
  end

  def reserved_carriage_params
    params.require(:reserved_carriage).permit(:upper_places, :bottom_places, :train_id)
  end
end
