class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.integer :phonenumber

      t.timestamps null: false
    end
  end
end
