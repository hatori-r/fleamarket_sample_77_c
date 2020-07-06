require 'rails_helper'

describe Item do
  describe '#create' do

    it "nameがない場合は登録できないこと" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("が入力されていません。")
    end

    it "introduceがない場合は登録できないこと" do
      item = build(:item, introduce: "")
      item.valid?
      expect(item.errors[:introduce]).to include("が入力されていません。")
    end

    it "statusがない場合は登録できないこと" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("が入力されていません。")
    end

    it "shipping_feeがない場合は登録できないこと" do
      item = build(:item, shipping_fee: "")
      item.valid?
      expect(item.errors[:shipping_fee]).to include("が入力されていません。")
    end

    it "shipping_areaがない場合は登録できないこと" do
      item = build(:item, shipping_area: "")
      item.valid?
      expect(item.errors[:shipping_area]).to include("が入力されていません。")
    end

    it "shipping_dayがない場合は登録できないこと" do
      item = build(:item, shipping_day: "")
      item.valid?
      expect(item.errors[:shipping_day]).to include("が入力されていません。")
    end

    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("が入力されていません。")
    end
  end
end
