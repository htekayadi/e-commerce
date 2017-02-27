class OrderLine < ActiveRecord::Base

  before_validation :total_price

  belongs_to :order
  belongs_to :product

  validates :product, :order, :qty, :unit_price, :total_price, presence: true
  validates :qty, numericality: { greater_than_or_equal_to: 1 }
  validates :unit_price, numericality: { greater_than_or_equal_to: 1.0 }
  
  def total_price
    self.total_price = qty * unit_price
  end
end
