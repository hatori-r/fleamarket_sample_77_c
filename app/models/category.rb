class Category < ApplicationRecord

  has_ancestry
  has_many :items


  def self.get_parent_category
    #セレクトボックスの初期値設定
    category_parent_array = ["選択してください"]
    #データベースから親カテゴリーのみ抽出→配列化
    Category.where(ancestry: nil).each do |parent|
      category_parent_array << parent.name
    end
    return category_parent_array
  end

end
