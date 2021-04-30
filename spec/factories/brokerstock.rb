FactoryBot.define do
  factory :broker_stock do
    id { 2 }
    user_id { 1 }
    ticker { 'TEST' }
    company { 'TEST Inc.' }
    price { 101.5 }
  end
end
