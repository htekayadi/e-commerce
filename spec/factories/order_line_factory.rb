FactoryGirl.define do
  factory :order_line do
    order { FactoryGirl.create(:order) }
    product { FactoryGirl.create(:product) }
    qty 1
    unit_price 1.5
  end
end
