json.extract! item, :id, :name, :introduce, :status, :shipping_fee, :shipping_area, :date, :price_introduce, :user_id, :category_id, :brand_id, :created_at, :updated_at
json.url item_url(item, format: :json)
