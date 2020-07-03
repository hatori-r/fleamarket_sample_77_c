class Credit < ApplicationRecord
  belongs_to :user

  def self.get_card(customer_id)  ## カード情報を取得する
    # PAYJPのメソッドを使うためにまずPayjp.api_keyでAPIキーを読み込む
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    
    customer = Payjp::Customer.retrieve(customer_id)
    card_data = customer.cards.first

  end

end
