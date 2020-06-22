Rails.application.routes.draw do
  resources :images
  resources :items
  resources :brands
  resources :categories
  resources :send_adresses
  devise_for :users
  root to: "home#index"

  #担当：アドリアン　このコメントは消さないでください。ターミナル で生成した回答でまだ使用させていただきます。6/
  # Some setup you must do manually if you haven't yet:

  #   Ensure you have overridden routes for generated controllers in your routes.rb.
  #   For example:
  
  #     Rails.application.routes.draw do
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
