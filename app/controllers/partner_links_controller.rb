class PartnerLinksController < ApplicationController
  before_action :set_partner_link, only: [:show, :edit, :update, :destroy]
  permits :company_id, :name, :description, :avatar, :active, :link

  # GET /partner_links
  def index
    @partner_links = PartnerLink.all
  end

  # GET /partner_links/1
  def show
  end

  # GET /partner_links/new
  def new
    @partner_link = PartnerLink.new
    @partner_link.company_id = params[:company_id]
    @partner_link.active = true
  end

  # GET /partner_links/1/edit
  def edit
  end

  # POST /partner_links
  def create(partner_link)
    @partner_link = PartnerLink.new(partner_link)
    if @partner_link.save
      redirect_to company_path(:id => @partner_link.company, :topic => "Link"), notice: 'Partner link was successfully created.'
    else
      render :new
    end
  end

  # PUT /partner_links/1
  def update(partner_link)
    if @partner_link.update(partner_link)
      redirect_to company_path(:id => @partner_link.company, :topic => "Link"), notice: 'Partner link was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /partner_links/1
  def destroy
    @comp = @partner_link.company_id
    @partner_link.destroy
      redirect_to company_path(:id => @comp, :topic => "Link"), notice: 'Partner link was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner_link(id)
      @partner_link = PartnerLink.find(id)
    end
end
