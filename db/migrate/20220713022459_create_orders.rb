class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.decimal :total
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :orders, :deleted_at
  end
end
