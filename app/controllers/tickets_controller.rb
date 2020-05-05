class TicketsController < ApplicationController
  before_action :set_ticket, only: [:update, :edit, :destroy, :show]
  before_action :set_user, only: [:new, :create]
  before_action :set_train, only: [:new, :create]


  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = @user.tickets.new(ticket_params)
    @ticket.train = @train
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private
  def ticket_params
    params.require(:ticket).permit(:passenger_name, :routes_name, :user_id, :train_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end