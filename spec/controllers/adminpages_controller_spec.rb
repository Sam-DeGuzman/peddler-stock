require 'rails_helper'

RSpec.describe AdminpagesController, type: :controller do
  login_admin

  describe 'GET index page' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'Basic Admin Account Functions' do
    it 'get application transactions' do
      get :transactions
      expect(response).to be_successful
      Transaction.all
    end

    it 'create a new buyer user' do
      get :new
      expect(response).to be_successful
      newbuyer = attributes_for(:user, :buyer)
      User.create! newbuyer
    end

    it 'create a new broker user' do
      get :new
      expect(response).to be_successful
      newbroker = attributes_for(:user, :broker)
      User.create! newbroker
    end

    it 'list all registered users' do
      get :user
      expect(response).to be_successful
      User.all
    end
  end
end
