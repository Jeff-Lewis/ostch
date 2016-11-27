class MstatsController < ApplicationController
  before_action :set_mstat, only: [:show, :edit, :update, :destroy]
  permits :status, :mobject_id, :user_id, :company_id, :amount, :anonymous

  # GET /mstats
  def index
    @mstats = Mstat.where("mobject_id=?", params[:mobject_id]).order(amount: :desc).page(params[:page]).per_page(10)
    @mstatanz = @mstats.count
  end

  # GET /mstats/1
  def show
  end

  # GET /mstats/new
  def new
    @mstat = Mstat.new
    @mstat.mobject_id = params[:mobject_id]
    @mstat.amount = Mobject.find(params[:mobject_id]).price
    @dontype = params[:dontype]
    if params[:dontype] == "User"
        @mstat.user_id = current_user.id
    end
    @mstat.anonymous = false
  end

  # GET /mstats/1/edit
  def edit
    @mstat.status = "changed"
  end

  # POST /mstats
  def create(mstat)
    @mstat = Mstat.new(mstat)
    if @mstat.save
      redirect_to mobject_path(:id => @mstat.mobject_id, :topic => "CF_Transaktionen"), notice: 'Mstat was successfully created.'
    else
      render :new
    end
  end

  # PUT /mstats/1
  def update(mstat)
    if @mstat.update(mstat)
      redirect_to mobject_path(:id => @mstat.mobject_id, :topic => "CF_Transaktionen"), notice: 'Mstat was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mstats/1
  def destroy
    @id = @mstat.mobject_id
    @mstat.destroy
    redirect_to mobject_path(:id => @id, :topic => "CF_Transaktionen"), notice: 'Mstat was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mstat(id)
      @mstat = Mstat.find(id)
    end
end
