class Admin::SeatsCarriagesController < Admin::BaseController
  before_action :set_seats_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @seats_carriages = SeatsCarriage.all
  end

  def show
  end

  def new
    @seats_carriage = SeatsCarriage.new
  end

  def create
    @seats_carriage = @train.carriages.seats.new(seats_carriage_params)

    if @seats_carriage.save
      redirect_to admin_seats_carriage_path(@seats_carriage)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @seats_carriage.update(seats_carriage_params)
      redirect_to admin_seats_carriage_path(@seats_carriage)
    else
      render :edit
    end
  end

  def destroy
    @seats_carriage.destroy
    redirect_to admin_seats_carriages_path
  end

  private
  def set_seats_carriage
    @seats_carriage = SeatsCarriage.find(params[:id])
  end

  def seats_carriage_params
    params.require(:seats_carriage).permit(:number, :seat_places, :train_id, :type)
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end
