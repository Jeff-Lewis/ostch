class WebmastersController < ApplicationController
  before_action :set_webmaster, only: [:show, :edit, :update, :destroy]
  permits :object_name, :object_id, :user_id, :web_user_id, :user_comment, :web_user_comment, :status

  # GET /webmasters
  def index
    @webmasters = Webmaster.search(params[:search]).order(created_at: :desc).page(params[:page]).per_page(10)
    @webanz = @webmasters.count
  end

  # GET /webmasters/1
  def show
  end

  # GET /webmasters/new
  def new
    @webmaster = Webmaster.new
    @webmaster.object_name = params[:object_name]
    @webmaster.object_id = params[:object_id]
    @webmaster.user_id = params[:user_id]
    @webmaster.status = "CHECK"
  end

  # GET /webmasters/1/edit
  def edit
    @webmaster.web_user_id = current_user.id
    @webmaster_edit = true
  end

  # POST /webmasters
  def create(webmaster)
    @webmaster = Webmaster.new(webmaster)
    @webmaster.status = "CHECK"
    if @webmaster.save
      redirect_to webmasters_path :page => session[:page], notice: 'Webmaster was successfully updated.'
      # webmasters_path, notice: 'Webmaster was successfully created.'
    else
      render :new
    end
  end

  # PUT /webmasters/1
  def update(webmaster)
    case params[:commit]
      when "Speichern"
        @webmaster.status = "CHECK"
      when "Freigeben"
        @webmaster.status = "OK"
        item = Object.const_get(@webmaster.object_name).find(@webmaster.object_id)
        if item
          item.active = true
          item.save
        end
      when "Sperren"
        item = Object.const_get(@webmaster.object_name).find(@webmaster.object_id)
        if item
          item.active = false
          item.save
        end
        @webmaster.status = "NOK"
    end 
    if @webmaster.update(webmaster)
      redirect_to webmasters_path :page => session[:page], notice: 'Webmaster was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /webmasters/1
  def destroy
    @webmaster.destroy

    redirect_to webmasters_path :page => session[:page], notice: 'Webmaster was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webmaster(id)
      @webmaster = Webmaster.find(id)
    end
end
