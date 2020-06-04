class TicketsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :set_ticket, only: [:update, :edit, :destroy, :show]
  before_action :set_train, only: [:new, :create]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @user = current_user
    @ticket = current_user.tickets.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    @ticket.train = @train

    if @ticket.save
      redirect_to @ticket
    else
      redirect_to new_search_path
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
    redirect_to user_path(current_user)
  end

  private
  def ticket_params
    params.require(:ticket).permit(:passenger_name, :train_id, :user_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end