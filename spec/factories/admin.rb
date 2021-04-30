FactoryBot.define do
  factory :admin do
    sequence :email do |n|
      "admin#{n}@example.com"
    end

    password { 'admin123' }
  end
end
