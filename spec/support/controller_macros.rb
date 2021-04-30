module ControllerMacros
  def login_buyer
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user, :buyer)
      sign_in user
    end
  end

  def login_broker
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user, :broker)
      sign_in user
    end
  end

  def login_admin
    before do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      admin = FactoryBot.create(:admin)
      sign_in admin
    end
  end
end
