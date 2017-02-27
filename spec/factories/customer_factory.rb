FactoryGirl.define do
  factory :customer do
    sequence(:email) { |e| "email#{e}@mail.com" }
    firstname "R2"
    lastname "D2"
    password "12345678"
    encrypted_password "$2a$11$0ABnDSJ73hjuK9I7l8irleKzhxxfDwTJ7SZFme4/uwW9OqFH/tHbu"
  end
end