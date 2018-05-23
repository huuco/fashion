class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string :title
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
