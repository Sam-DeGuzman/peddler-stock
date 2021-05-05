class BuyersController < ApplicationController
  def index
    @forsale = BrokerStock.all
  end

  def create
    if BuyerStock.where(user_id: current_user.id).exists?(ticker: params[:ticker])

      existing = BuyerStock.where(user_id: current_user.id).where(ticker: params[:ticker])

      quantity_arr = existing.pluck(:quantity)

      quantity = quantity_arr[0]

      existqty = quantity + params[:quantity].to_i

      existing.update(quantity: existqty, price: params[:price])

      @record = Transaction.create(transactions_params)

      redirect_to buyers_path, notice: 'Added To Portfolio'

    else
      @buy = BuyerStock.create(buyers_params)
      @record = Transaction.create(transactions_params)

      if @buy.save
        redirect_to buyers_path, notice: ' Successfully Added Stock to Portfolio'
      else
        redirect_to buyers_path, notice: 'Error Adding Stock to Portfolio'
      end

    end
  end

  def edit; end

  def new
    @stock = BrokerStock.find_by(id: params[:id])
  end

  def update; end

  def show; end

  def portfolio
    @stocks = BuyerStock.where(user_id: current_user.id)
  end

  def transactions
    @transactions = Transaction.where(user_id: current_user.id).order('created_at ASC')
  end

  def buyers_params
    params.permit(:user_id, :ticker, :company, :quantity, :price)
  end

  def transactions_params
    params.permit(:user_id, :broker_id, :ticker, :quantity, :price)
  end
end
