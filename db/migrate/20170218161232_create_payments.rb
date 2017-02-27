class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :order, index: true, foreign_key: true, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :payment_state, null: false
      t.string :paypal_reference_id
      t.string :paypal_token

      t.timestamps null: false
    end
  end
end
