class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price, default: 0
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :order_items, :deleted_at
  end
end
