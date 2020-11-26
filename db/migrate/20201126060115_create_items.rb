class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.text :detail
      t.integer :category_id
      t.integer :quality_id
      t.integer :prefecture_id
      t.integer :shipped_date_id
      t.integer :shipment_burden_id
      t.references :user,foreign_key: true
      t.timestamps
    end
  end
end
