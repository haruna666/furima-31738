class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_coad, null: false
      t.integer :prefecture, null: false
      t.string :city, null: false
      t.string :addresses, null: false
      t.string :building, null: false
      t.string :phone_number, null: false
      t.timestamps
    end
  end
end
