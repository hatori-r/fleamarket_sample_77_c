class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.string      :card_id,     null: false
      t.string      :customer_id, null: false
      t.references  :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end