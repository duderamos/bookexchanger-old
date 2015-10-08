Rails.application.routes.draw do
  scope '(:locale)', locale: /en|pt-BR/ do
    devise_scope :user do
      get '/login', to: 'devise/sessions#new'
      get '/logout', to: 'devise/sessions#destroy'
    end
    devise_for :users

    resources :books do
      member do
        get 'wish'
      end
    end

    authenticated do
      root to: 'books#index', as: :authenticated
    end

    root 'home#index'
  end
end
