Rails.application.routes.draw do
  resources :purchases, only: :index
  resources :purchase_list_uploads, only: [:new, :create]

  root to: 'purchases#index'
end
