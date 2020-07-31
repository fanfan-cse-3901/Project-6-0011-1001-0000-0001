class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @title = 'Transactions'
    if current_user.admin
      @transactions = Transaction.all
    else
      respond_to do |format|
        format.html { redirect_to home_index_url, alert: 'You are not permitted to access this page.' }
      end
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @title = 'New Transactions'
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
    @title = 'Edit Transactions'
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    # @item = Item.find(params[:id])
    # @transaction.item_id = params.dig(@item.id)
    # @item = Item.new(profile_params)
    if current_user.id == @transaction.user_id
      respond_to do |format|
        format.html { redirect_to profile_user_profile_path, alert: 'Transaction cannot create transaction for self.' }
      end
    else
      respond_to do |format|
        if @transaction.save
          format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
          format.json { render :show, status: :created, location: @transaction }
        else
          format.html { render :new }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:item_id, :user_id, :rating)
  end
end
