require 'rails_helper'

RSpec.describe BuyersController, type: :controller do
  login_buyer

  describe 'GET index page' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'Basic Buyer Account Functions' do
    it 'get owned BuyerStock' do
      BuyerStock.where(user_id: 1)
    end

    it 'get related transactions' do
      get :transactions
      Transaction.where(user_id: 1)
    end
  end

  describe 'buy stock and record transaction' do
    it 'create BuyerStock' do
      stock = attributes_for(:buyer_stock)
      get :new
      BuyerStock.create! stock
    end

    it 'record transaction' do
      transaction = attributes_for(:transaction)

      Transaction.create(transaction)
    end
  end
end
