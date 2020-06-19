class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :family_name
      t.string :first_name
      t.string :family_name_kana
      t.string :first_name_kana
      t.date :birthday
      t.text :image
      t.text :introduction
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
