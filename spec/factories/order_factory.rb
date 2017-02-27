FactoryGirl.define do
  factory :order do
    order_no 12467
    customer { FactoryGirl.create(:customer) }
    total 1000
    status 0
  end
end
