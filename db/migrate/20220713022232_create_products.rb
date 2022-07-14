class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.text :description
      t.decimal :unit_price, default: 0
      t.boolean :is_discontinued, default: false
      t.boolean :is_featured, default: false
      t.references :category, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :products, :deleted_at
  end
end
