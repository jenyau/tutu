class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def show
  end

def new
    @carriage = Carriage.new
end

def create
    @carriage = @train.carriages.new(carriage_params)
    if @carriage.save
    redirect_to @carriage
    else
    render :new
    end
end

def edit
end

def update
    if @carriage.update(carriage_params)
    redirect_to @carriage
    else
    render :edit
    end
end

def destroy
    @carriage.destroy
    redirect_to carriages_path
end

private
def carriage_params
    params.require(:carriage).permit(:number, :seats_places, :top_seats, :bottom_seats, :train_id, :type)
end

  def set_carriage
      @carriage = Carriage.find(params[:id])
  end
  def set_train
      @train = Train.find(params[:train_id])
  end
end
