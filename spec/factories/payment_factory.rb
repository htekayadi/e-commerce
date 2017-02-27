FactoryGirl.define do
  factory :payment do
    order nil
    amount "9.99"
    payment_state "MyString"
    paypal_reference_id "MyString"
    paypal_token "MyString"
  end

end
