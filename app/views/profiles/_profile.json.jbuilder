json.extract! profile, :id, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, :image, :introduction, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
