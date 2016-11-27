class MdetailsController < ApplicationController
  before_action :set_mdetail, only: [:show, :edit, :update, :destroy]
  permits :status, :mobject_id, :name, :description, :avatar, :document

  # GET /mdetails
  def index
    @mdetails = Mdetail.all
  end

  # GET /mdetails/1
  def show
  end

  # GET /mdetails/new
  def new
    @mdetail = Mdetail.new
    @mdetail.mobject_id = params[:mobject_id]
  end

  # GET /mdetails/1/edit
  def edit
    @mdetail.status = "changed"
  end

  # POST /mdetails
  def create(mdetail)
    @mdetail = Mdetail.new(mdetail)
    if @mdetail.save
      redirect_to mobject_path(:id => @mdetail.mobject_id, :topic => "Details"), notice: 'Details was successfully created.'
    else
      render :new
    end
  end

  # PUT /mdetails/1
  def update(mdetail)
    if @mdetail.update(mdetail)
      redirect_to mobject_path(:id => @mdetail.mobject_id, :topic => "Details"), notice: 'Details was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mdetails/1
  def destroy
    @id = @mdetail.mobject_id
    @mdetail.destroy
    redirect_to mobject_path(:id => @id, :topic => "Details"), notice: 'Details was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mdetail(id)
      @mdetail = Mdetail.find(id)
    end
end
