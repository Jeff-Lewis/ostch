class MratingsController < ApplicationController
  before_action :set_mrating, only: [:show, :edit, :update, :destroy]
  permits :status, :user_id, :mobject_id, :comment, :rating

  # GET /mratings
  def index
    @mratings = Mrating.all
  end

  # GET /mratings/1
  def show
  end

  # GET /mratings/new
  def new
    @mrating = Mrating.new
    @mrating.mobject_id = params[:mobject_id]
    @mrating.user_id = current_user.id
    @mrating.rating = 3
  end

  # GET /mratings/1/edit
  def edit
  end

  # POST /mratings
  def create(mrating)
    @mrating = Mrating.new(mrating)
    if @mrating.save
      redirect_to mobject_path(:id => @mrating.mobject_id, :topic => "Ratings"), notice: 'Rating was successfully created.'
    else
      render :new
    end
  end

  # PUT /mratings/1
  def update(mrating)
    if @mrating.update(mrating)
      redirect_to mobject_path(:id => @mrating.mobject_id, :topic => "Ratings"), notice: 'Rating was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mratings/1
  def destroy
    @id = @mrating.mobject_id
    @mrating.destroy
      redirect_to mobject_path(:id => @id, :topic => "Ratings"), notice: 'Rating was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mrating(id)
      @mrating = Mrating.find(id)
    end
end
