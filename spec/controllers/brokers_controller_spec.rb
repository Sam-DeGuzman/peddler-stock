require 'rails_helper'

RSpec.describe BrokersController, type: :controller do
  login_broker

  describe 'GET index page' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'Basic Broker Account Functions' do
    it 'get owned BrokerStock' do
      BrokerStock.where(user_id: 1)
    end

    it 'create BrokerStock' do
      stock = attributes_for(:broker_stock)
      get :new
      BrokerStock.create! stock
    end

    it 'get related transactions' do
      get :transactions
      Transaction.where(broker_id: 1)
    end
  end
end
