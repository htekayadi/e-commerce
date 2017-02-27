require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "should have valid factory" do
    FactoryGirl.build(:admin).should be_valid
  end

  it "should require email" do
    FactoryGirl.build(:customer, :email => "").should_not be_valid
  end

  it "should require email formatted" do
    FactoryGirl.build(:customer, :email => "test_email").should_not be_valid
  end

  it "should require password" do
    FactoryGirl.build(:customer, :password => "").should_not be_valid
  end

  it "should require password and confirm_password to be same" do
    FactoryGirl.build(:customer, :password => "test_password",
                      :password_confirmation => "wrong_password").should_not be_valid
  end

  it "should require password to be minimum 7 characters" do
    FactoryGirl.build(:customer, :password => "test").should_not be_valid
  end
end
