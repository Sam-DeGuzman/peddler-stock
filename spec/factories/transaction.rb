FactoryBot.define do
  factory :transaction do
    id { 2 }
    user_id { 1 }
    broker_id { 2 }
    ticker { 'TEST' }
    quantity { 10 }
    price { 10.5 }
  end
end
