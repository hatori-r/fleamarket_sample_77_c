class CreateSendAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :send_addresses do |t|
      t.string :send_family_name
      t.string :send_first_name
      t.string :send_family_kana
      t.string :send_first_kana
      t.string :post_number
      t.integer :prefectures_id
      t.string :city
      t.string :address
      t.string :apartment
      t.integer :tell_number
      t.string :sendscol
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
