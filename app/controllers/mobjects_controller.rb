class MobjectsController < ApplicationController
  before_action :set_mobject, only: [:show, :edit, :update, :destroy]
  permits    :mtype, :msubtype, :mcategory_id, :company_id, :user_id, :status, :name, :description, :reward, :interest_rate, :due_date, :date_from, :date_to, :time_from, :time_to, :days, :amount, :price, :tasks, :skills, :offers, :social, :price_reg, :price_new, :active, :keywords, :homepage, :address1, :address2, :address3, :latitude, :longitude, :geo_address

  # GET /mobjects
  def index
    @mobjects = Mobject.search(nil, nil, params[:filter_id], params[:mtype], params[:msubtype], params[:search]).order(created_at: :desc).page(params[:page]).per_page(10)
    @mobanz = @mobjects.count
    @mtype = params[:mtype]
    @msubtype = params[:msubtype]
    @param = params[:filter_id]
    @search = params[:search]
  end

  # GET /mobjects/1
  def show
    if !params[:topic]
      @topic = "Informationen"
    else
      @topic = params[:topic]
    end
    if !session[:cw]
      session[:cw] = Date.today.cweek.to_i
    end
    if !session[:year]
      session[:year] = Date.today.year.to_i
    end
    if params[:dir]
      case params[:dir]
        when ">"
          if session[:cw] == 52
            session[:cw] = 1
            session[:year] = session[:year].to_i + 1
          else
            session[:cw] = session[:cw].to_i + 1
          end
        when "<"
          if session[:cw] == 1
            session[:cw] = 52
            session[:year] = session[:year].to_i - 1
          else
            session[:cw] = session[:cw].to_i - 1
          end
      end
    end
    @start = Date.commercial(session[:year],session[:cw],1)
    @calendars = Mcalendar.search(@mobject.id, session[:cw], session[:year]).order(date_from: :asc)
    @calanz = @calendars.count
    
    @mobjects_anz = Mstat.select("date(created_at) as datum, count(amount) as summe").where('mobject_id = ?', @mobject.id).group("date(created_at)")
    @mobjects_bet = Mstat.select("date(created_at) as datum, sum(amount) as summe").where('mobject_id = ?', @mobject.id).group("date(created_at)")
    
  end

  # GET /mobjects/new
  def new
    @mobject = Mobject.new
    @mobject.status = "new"
    @mobject.mtype = params[:mtype]
    @mobject.msubtype = params[:msubtype]
    @mobject.mcategory_id = params[:msubtype]
    @mobject.user_id = params[:user_id]
    @mobject.company_id = params[:company_id]
    @mobject.active = true
    @mobject.social = false
    @mobject.name = @mobject.mtype
    @mobject.description = "Beschreibung..."
    @mobject.homepage = "www.xxx.ch"
    @mobject.price_reg = 0
    @mobject.price_new = 0
    @mobject.date_from = Date.today
    @mobject.date_to = Date.today+30
    @mobject.time_from = 7
    @mobject.time_to = 18
    @mobject.amount = 10000.00
    @mobject.price = 100.00
    @mobject.reward = "Belohnung..."
    @mobject.interest_rate = 5
    @mobject.due_date = Date.today + 365
    if @mobject.user_id
      @mobject.address1 = @mobject.user.address1
      @mobject.address2 = @mobject.user.address2
      @mobject.address3 = @mobject.user.address3
      @mobject.geo_address = @mobject.user.geo_address
      @mobject.longitude = @mobject.user.longitude
      @mobject.latitude = @mobject.user.latitude
    end
    if @mobject.company_id
      @mobject.address1 = @mobject.company.address1
      @mobject.address2 = @mobject.company.address2
      @mobject.address3 = @mobject.company.address3
      @mobject.geo_address = @mobject.company.geo_address
      @mobject.longitude = @mobject.company.longitude
      @mobject.latitude = @mobject.company.latitude
    end
    case params[:mtype]
      when "Angebote"
        case params[:msubtype]
          when "Standard"
          when "Aktion"
        end
      when "Veranstaltungen"
      when "Ausscheibungen"
      when "Ausflugsziele"
      when "Crowdfunding"
        case params[:msubtype]
          when "Spenden"
          when "Belohnungen"
          when "Zinsen"
        end
      when "Kleinanzeigen"
      when "Stellenanzeigen"
      when "Vermietungen"
    end
  end

  # GET /mobjects/1/edit
  def edit
  end

  # POST /mobjects
  def create(mobject)
    @mobject = Mobject.new(mobject)

    if @mobject.save
      redirect_to @mobject, notice: 'Mobject was successfully created.'
    else
      render :new
    end
  end

  # PUT /mobjects/1
  def update(mobject)
    if @mobject.update(mobject)
      redirect_to @mobject, notice: 'Mobject was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mobjects/1
  def destroy
    @mobject.destroy
    redirect_to mobjects_url, notice: 'Mobject was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mobject(id)
      @mobject = Mobject.find(id)
    end
end
