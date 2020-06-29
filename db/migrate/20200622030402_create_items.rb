class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :introduce
      t.integer :status
      t.integer :shipping_fee
      t.integer :shipping_area
      t.integer :shipping_day
      t.integer :price_introduce
      t.references :user, foreign_key: true
      # t.references :category, foreign_key: true
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
