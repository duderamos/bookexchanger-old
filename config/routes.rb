Rails.application.routes.draw do
  devise_for :users
  get '/login', to: 'devise/session#new'
  root 'home#index'
end
