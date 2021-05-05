require 'rails_helper'

RSpec.describe BuyerStock, type: :model do
  # Validations

  it { expect(described_class.new).to validate_presence_of :user_id }
  it { expect(described_class.new).to validate_presence_of :ticker }
  it { expect(described_class.new).to validate_presence_of :company }
  it { expect(described_class.new).to validate_presence_of :quantity }
  it { expect(described_class.new).to validate_presence_of :price }

  # Callback
  it { expect(described_class.new).to callback(:compute_total_price_create).before(:save) }
  # it { is_expected.to callback(:compute_total_price_create).before(:save) }

  # Method
  describe 'find_db' do
    it 'created stock should be found existing' do
      user = FactoryBot.create(:user, :buyer)

      stockattr = attributes_for(:buyer_stock)

      stock = described_class.create! stockattr

      expect(described_class.find_db(user.id, stock.ticker)).not_to be_nil
    end
  end
end
