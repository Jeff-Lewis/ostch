class UserTicketsController < ApplicationController
  before_action :set_user_ticket, only: [:show, :edit, :update, :destroy]
  permits :user_id, :ticket_id, :status

  # GET /user_tickets
  def index
    @user_tickets = UserTicket.where('user_id=?',current_user.id)
  end

  # GET /user_tickets/1
  def show
  end

  # GET /user_tickets/new
  def new
    @user_ticket = UserTicket.new
    @user_ticket.user_id = params[:user_id]
    @user_ticket.ticket_id = params[:ticket_id]
    @user_ticket.status = "persönlich"
    @user_ticket.save
    redirect_to User.find(@user_ticket.user_id), notice: 'User ticket was successfully created.'    
  end

  # GET /user_tickets/1/edit
  def edit
  end

  # POST /user_tickets
  def create(user_ticket)
    @user_ticket = UserTicket.new(user_ticket)

    if @user_ticket.save
      redirect_to @user_ticket, notice: 'User ticket was successfully created.'
    else
      render :new
    end
  end

  # PUT /user_tickets/1
  def update(user_ticket)
    if @user_ticket.update(user_ticket)
      redirect_to @user_ticket, notice: 'User ticket was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /user_tickets/1
  def destroy
    @ticket_id = @user_ticket.ticket_id
    @user_ticket.destroy
    redirect_to ticketuserview_index_path :ticket_id => @ticket_id, notice: 'User ticket was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_ticket(id)
      @user_ticket = UserTicket.find(id)
    end
end
