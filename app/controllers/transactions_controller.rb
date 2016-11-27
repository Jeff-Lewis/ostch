class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  permits :account_ver, :account_bel, :valuta, :trx_date, :company_id, :user_id, :ttype, :status, :active, :text, :ref, :amount, :object_name, :object_id

  # GET /transactions
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  def show
  end

  # GET /transactions/new
  def new
    
    @transaction = Transaction.new

    @transaction.user_id = params[:user_id]
    @transaction.company_id = params[:company_id]
    @transaction.ttype = "Payment"
    @transaction.trx_date = Date.today
    @transaction.valuta = Date.today
    @transaction.amount = params[:amount]
    @transaction.account_bel = params[:account_bel]
    @transaction.status = "erfasst"
    @transaction.ref = params[:ref]
    @transaction.text = ""
    @transaction.object_id = params[:object_id].to_i
    @transaction.object_name = params[:object_name]

    @item = Object.const_get(params[:object_name]).find(params[:object_id])
    
    # Vergütungskonto 
    if params[:user_id_ver]
      @user = User.find(params[:user_id_ver])
      @partners = Company.where('partner=?',true)
      @partners.each do |p|
        @customer = Customer.where("user_id=? AND partner_id=?", params[:user_id_ver], p.id).first
        if @customer
          @account = @customer.accounts.where('is_account_ver=?',true).first
          if @account != nil
            @transaction.account_ver = @account.id
            @bv_1 = @user.name + " " + @user.lastname
            @bv_2 = @account.name
            @bv_3 = @account.iban
          end
        end
      end
    end
    if params[:company_id_ver]
      @company = Company.find(params[:company_id_ver])
      @partners = Company.where('partner=?',true)
      @partners.each do |p|
        @customer = Customer.where("company_id=? AND partner_id=?", params[:company_id_ver], p.id).first
        if @customer
          @account = @customer.accounts.where('is_account_ver=?',true).first
          if @account != nil
            @transaction.account_ver = @account.id
            @bv_1 = @company.name
            @bv_2 = @account.name
            @bv_3 = @account.iban
          end
        end
      end
    end
    if !@account
      redirect_to @item, notice: 'no counterpart account defined, trx not possible'
      return
    end
    
  end

  # GET /transactions/1/edit
  def edit
    @account = Account.find(@transaction.account_ver)
    if params[:user_id]
      @user = User.find(params[:user_id])
      @ali = []
      @partners = Company.where('partner=?',true)
      @partners.each do |p|
        @customer = Customer.where("user_id=? AND partner_id=?", params[:user_id], p.id).first
        if @customer
          @customer.accounts.each do |ca|
            @ali << ca.id
          end
        end
      end
    end
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @ali = []
      @partners = Company.where('partner=?',true)
      @partners.each do |p|
        @customer = Customer.where("company_id=? AND partner_id=?", params[:company_id], p.id).first
        if @customer
          @customer.accounts.each do |ca|
            @ali << ca.id
          end
        end
      end
    end
  end

  # POST /transactions
  def create(transaction)
    @transaction = Transaction.new(transaction)
    if @transaction.save
      @item = Object.const_get(@transaction.object_name).find(@transaction.object_id)
      redirect_to @item, notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  # PUT /transactions/1
  def update(transaction)
    @item = Object.const_get(@transaction.object_name).find(@transaction.object_id)
    if @transaction.update(transaction)
      redirect_to @item, notice: 'Transaction was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /transactions/1
  def destroy
    @item = Object.const_get(@transaction.object_name).find(@transaction.object_id)
    @transaction.destroy
    redirect_to @item, notice: 'Transaction was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction(id)
      @transaction = Transaction.find(id)
    end
end
