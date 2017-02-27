FactoryGirl.define do
  factory :product do
    description "description"
    sequence(:name) { |e| "product#{e}" }
    price 9.99
    status false
  end

end
