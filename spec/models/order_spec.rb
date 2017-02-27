require 'rails_helper'

RSpec.describe Order, type: :model do

  it "should have valid factory" do
    FactoryGirl.build(:order).should be_valid
  end

  it "should have a valid customer id" do
    FactoryGirl.build(:order, :customer_id => "s").should_not be_valid
  end

end
