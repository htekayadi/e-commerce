class Product < ActiveRecord::Base

  scope :is_enabled, -> { where(status: true) }

  has_many :order_lines

  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1.0 }
  validates :name, uniqueness: true
end
