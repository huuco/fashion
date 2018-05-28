class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :alias
      t.string :full_name
      t.string :post_code
      t.string :city
      t.string :country
      t.string :phone
      t.integer :user_id

      t.timestamps
    end
  end
end
