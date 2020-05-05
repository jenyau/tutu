class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :update, :edit, :destroy, :time_edit]
  
    def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(train_params)
    
    if @route.save
        redirect_to @route
    else
        render :new
    end
  end

  def edit
  end

  def update
    if @route.update(train_params)
        redirect_to @route
    else
        render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_path
  end

  def time_edit
  end

  
  private
  def train_params
    params.require(:route).permit(:name, railway_station_ids:[])
  end

  def set_route
    @route = Route.find(params[:id])
  end
end