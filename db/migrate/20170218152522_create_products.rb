class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :description, null: false
      t.string :name, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.boolean :status, null: false

      t.timestamps null: false
    end
  end
end