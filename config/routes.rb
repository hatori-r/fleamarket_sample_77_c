Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'send_addresses', to: 'users/registrations#new_address'
    post 'send_addresses', to: 'users/registrations#create_address'
  end
  
  resources :credits
  # resources :send_addresses
  resources :images
  resources :items do
    # （↓7つのアクション以外のルートを設定↓）
    # （本来はidが必要なページですが、まだuserと連携していないため
    # 一時的にcollectionで定義しております。【本来はmember】）
    collection do
      get "buy"
      get "item_details"
      get "change"
    end
  end
  resources :brands
  resources :categories
  
  root to: "home#index"

  #担当：アドリアン このコメントは消さないでください。ターミナル で生成した回答でまだ使用させていただきます。6/
  # Some setup you must do manually if you haven't yet:

  #   Ensure you have overridden routes for generated controllers in your routes.rb.
  #   For example:
  
  #     Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  # resources :credits
  # resources :send_addresses
  # resources :images
  # resources :items
  # resources :brands
  # resources :categories
  # resources :send_adresses
  #       devise_for :users, controllers: {
  #         sessions: 'users/sessions'
  #       }
  #     end
  
  
end
