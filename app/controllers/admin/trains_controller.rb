class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: [:show, :edit, :destroy, :update]

  def index
    @trains = Train.all
  end

  def show
  end

  def new
    @train = Train.new
  end

  def create
    @train = Train.new(train_params)

    if @train.save
      redirect_to [:admin, @train]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @train.update(train_params)
      redirect_to admin_trains_path
    else
      render :edit
    end
  end

  def destroy
    @train.destroy
    redirect_to trains_path
  end

  private
  def train_params
    params.require(:train).permit(:number, :route_id, :railway_station_id)
  end

  def set_train
    @train = Train.find(params[:id])
  end
end