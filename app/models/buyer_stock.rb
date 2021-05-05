class BuyerStock < ApplicationRecord
  validates :user_id, :ticker, :company, :quantity, :price, presence: true

  belongs_to :user

  before_save :compute_total_price_create

  def compute_total_price_create
    self.total_price = 0
    self.total_price = (quantity * price).round(2)
  end
end
