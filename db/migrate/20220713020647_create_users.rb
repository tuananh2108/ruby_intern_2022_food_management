class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :address
      t.boolean :admin, default: false
      t.string :password_digest
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :users, :email, :unique => true
    add_index :users, :deleted_at
  end
end
