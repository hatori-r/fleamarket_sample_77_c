require 'rails_helper'
describe Credit do
  describe '#create' do
    it "user_idがない場合は登録できないこと" do
      credit = build(:credit, user_id: "")
      credit.valid?
      expect(credit.errors[:user_id]).to include("が入力されていません。")
    end
    it "customer_idがない場合は登録できないこと" do
      credit = build(:credit, customer_id: "")
      credit.valid?
      expect(credit.errors[:customer_id]).to include("が入力されていません。")
    end
    it "card_idがない場合は登録できないこと" do
      credit = build(:credit, card_id: "")
      credit.valid?
      expect(credit.errors[:card_id]).to include("が入力されていません。")
    end
  end
end