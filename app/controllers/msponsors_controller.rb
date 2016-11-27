class MsponsorsController < ApplicationController
  before_action :set_msponsor, only: [:show, :edit, :update, :destroy]
  permits :status, :company_id, :user_id, :mobject_id, :active, :slevel

  # GET /sponsors
  def index
    if params[:mobject_id]
      session[:mobject_id] = params[:mobject_id]
    end
    @msponsors = Msponsor.search(params[:mobject_id]).page(params[:page]).per_page(10)
  end

  # GET /sponsors/1
  def show
  end

  # GET /sponsors/new
  def new
    @msponsor = Msponsor.new
    @msponsor.mobject_id = params[:mobject_id]
    @msponsor.active = true
    @msponsor.slevel = "1"
    @msponsor.status = "new"
  end

  # GET /sponsors/1/edit
  def edit
    @msponsor.status = "changed"
  end

  # POST /sponsors
  def create(msponsor)
    @msponsor = Msponsor.new(msponsor)

    if @msponsor.save
      redirect_to mobject_path(:id => @msponsor.mobject_id, :topic => "Sponsoren"), notice: 'Sponsor was successfully created.'
    else
      render :new
    end
  end

  # PUT /sponsors/1
  def update(msponsor)
    if @msponsor.update(msponsor)
      redirect_to mobject_path(:id => @msponsor.mobject_id, :topic => "Sponsoren"), notice: 'Sponsor was successfully created.'
    else
      render :edit
    end
  end

  # DELETE /sponsors/1
  def destroy
    @id = @msponsor.mobject_id
    @msponsor.destroy
    redirect_to mobject_path(:id => @id, :topic => "Sponsoren"), notice: 'Sponsor was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_msponsor(id)
      @msponsor = Msponsor.find(id)
    end
end