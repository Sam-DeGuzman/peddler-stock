FactoryBot.define do
  factory :buyer_stock do
    id { 2 }
    user_id { 1 }
    ticker { 'TEST' }
    company { 'TEST Inc.' }
    quantity { 10 }
    price { 10.5 }
  end
end
