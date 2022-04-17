Rails.application.routes.draw do
  get 'search' => 'rooms#search'
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "home#index"
  resources :users
  resources :rooms do
    resource :favorites, only: [:create, :destroy]
  end
  resources :reservations

end
