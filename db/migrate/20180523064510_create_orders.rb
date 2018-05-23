class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :transaction_id
      t.integer :user_id
      t.float :total
      t.integer :status
      t.integer :shipping_id
      t.integer :payment_id
      t.integer :address_id

      t.timestamps
    end
  end
end
