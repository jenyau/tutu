class CompartmentCarriagesController < ApplicationController
  before_action :set_compartment_carriage, only: [:show, :update, :edit, :destroy]

  def index
    @compartment_carriages = CompartmentCarriage.all
  end

  def show
  end

  def new
    @compartment_carriage = CompartmentCarriage.new
  end

  def create
    @compartment_carriage = CompartmentCarriage.new(compartment_carriage_params)
    @compartment_carriage.carriage_type = 'compartment_carriage'
    if @compartment_carriage.save
      redirect_to @compartment_carriage
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @compartment_carriage.update(compartment_carriage_params)
      redirect_to @compartment_carriage
    else
      render :edit
    end
  end

  def destroy
    @compartment_carriage.destroy
    redirect_to compartment_carriages_path
  end

  private
  def compartment_carriage_params
    params.require(:compartment_carriage).permit(:upper_places, :bottom_places, :train_id)
  end

  def set_compartment_carriage
    @compartment_carriage = CompartmentCarriage.find(params[:id])
  end
end
