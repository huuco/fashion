class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.text :content
      t.integer :product_id
      t.integer :user_id
      t.integer :star
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
