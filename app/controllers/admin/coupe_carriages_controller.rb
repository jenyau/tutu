class Admin::CoupeCarriagesController < Admin::BaseController
  before_action :set_coupe_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def show
  end

  def new
    @coupe_carriage = CoupeCarriage.new
  end

  def create
    @coupe_carriage = @train.carriages.coupe.new(coupe_carriage_params)
    if @coupe_carriage.save
      redirect_to admin_coupe_carriage_path(@coupe_carriage)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @coupe_carriage.update(coupe_carriage_params)
      redirect_to admin_coupe_carriage_path(@coupe_carriage)
    else
      render :edit
    end
  end

  def destroy
    @coupe_carriage.destroy
    redirect_to admin_coupe_carriages_path
  end

  private
  def coupe_carriage_params
    params.require(:coupe_carriage).permit(:number, :seat_places, :top_seats, :bottom_seats, :train_id, :type)
  end

  def set_coupe_carriage
    @coupe_carriage = CoupeCarriage.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end
