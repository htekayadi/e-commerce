FactoryGirl.define do
  factory :admin do
    sequence(:email) { |e| "email#{e}@mail.com" }
    after(:build) {|u| u.password = "summeriscoming"}
  end
end