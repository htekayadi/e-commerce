class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :customer, index: true, foreign_key: true, null: false
      t.string :order_no, null: false
      t.decimal :total, precision: 10, scale: 2, null: false
      t.integer :status, null: false

      t.timestamps null: false
    end
  end
end
