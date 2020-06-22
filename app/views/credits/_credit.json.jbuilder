json.extract! credit, :id, :card_number, :expiration_year, :expiration_month, :security_code, :user_id, :created_at, :updated_at
json.url credit_url(credit, format: :json)
