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
      Transaction.all
    end

    it 'create a new buyer user' do
      get :new
      newbuyer = attributes_for(:user, :buyer)
      User.create! newbuyer
    end

    it 'create a new broker user' do
      get :new
      newbroker = attributes_for(:user, :broker)
      User.create! newbroker
    end

    it 'list all registered users' do
      get :user
      User.all
    end
  end
end
