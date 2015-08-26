Rails.application.routes.draw do
  devise_scope :user do
    get "/login" => "devise/sessions#new"
  end
  devise_for :users

  resources :books

  root 'home#index'
end
