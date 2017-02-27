class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.references :order, index: true, foreign_key: true, null: false
      t.references :product, index: true, foreign_key: true, null: false
      t.integer :qty, null: false
      t.decimal :unit_price, precision: 10, scale: 2, null: false
      t.decimal :total_price, precision: 10, scale: 2, null: false

      t.timestamps null: false
    end
  end
end
