require 'rails_helper'

RSpec.describe BuyersController, type: :controller do
  login_broker

  describe 'Basic Broker Account Functions' do
    it 'get owned BuyerStock' do
      get :portfolio
      BrokerStock.where(user_id: 1)
    end

    it 'get related transactions' do
      get :transactions
      Transaction.where(broker_id: 1)
    end
  end

  describe 'buy stock and record transaction' do
    it 'create BrokerStock' do
      stock = attributes_for(:broker_stock)
      BrokerStock.create! stock
    end
  end
end
