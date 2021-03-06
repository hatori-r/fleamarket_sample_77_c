Rails.application.routes.draw do
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
    member do
      get "buy"
    end
    collection do
      # カテゴリー機能のルーティング
      # アクションのリスポンスをdefaultsでjsonに限定
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
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
  # get 'users/destroy'
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
