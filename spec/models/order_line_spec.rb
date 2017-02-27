require 'rails_helper'

RSpec.describe OrderLine, type: :model do

  it "should have valid factory" do
    FactoryGirl.build(:order_line).should be_valid
  end

  it "should require qty in numerals" do
    FactoryGirl.build(:order_line, :qty => "s").should_not be_valid
  end

  it "should require qty to be not less then 1" do
    FactoryGirl.build(:order_line, :qty => 0).should_not be_valid
  end

  it "should require unit_price in numerals" do
    FactoryGirl.build(:order_line, :unit_price => "s").should_not be_valid
  end

  it "should require unit_price to be not less then 1" do
    FactoryGirl.build(:order_line, :unit_price => 0).should_not be_valid
  end

  it "should produce total price to be equal to qty * unit_price" do
    orderline = FactoryGirl.build(:order_line, :unit_price => 1.5, :qty => 2)
    orderline.save
    orderline.total_price.to_f.should equal(3.0)
  end

end
