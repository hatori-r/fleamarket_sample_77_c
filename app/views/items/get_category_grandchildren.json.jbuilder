# 孫要素の取得
json.array! @category_grandchildren do |grandchild|
  json.id grandchild.id
  json.name grandchild.name
end