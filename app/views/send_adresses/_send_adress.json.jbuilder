json.extract! send_adress, :id, :send_family_name, :send_first_name, :send_family_kana, :send_first_kana, :post_number, :prefectures, :city, :address, :apartment, :tell_number, :sendscol, :user_id, :created_at, :updated_at
json.url send_adress_url(send_adress, format: :json)
