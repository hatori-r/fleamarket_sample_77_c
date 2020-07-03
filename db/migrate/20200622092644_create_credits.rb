class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.references :user, foreign_key: true
      t.string :user_token ,null: false
      t.string :card_token ,null: false
      t.timestamps
    end
  end
end
