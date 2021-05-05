require 'rails_helper'

RSpec.describe Transaction, type: :model do
  # Validations

  it { expect(described_class.new).to validate_presence_of :user_id }
  it { expect(described_class.new).to validate_presence_of :broker_id }
  it { expect(described_class.new).to validate_presence_of :ticker }
  it { expect(described_class.new).to validate_presence_of :quantity }
  it { expect(described_class.new).to validate_presence_of :price }

  # Callback
  it { expect(described_class.new).to callback(:compute_total_price).before(:save) }
end
