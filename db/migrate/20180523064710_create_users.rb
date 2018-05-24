class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.integer :role, default: 1
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
