Deals::Application.routes.draw do
  root to: 'Cities#show'

  get   '/welcome'        =>      'Welcome#home'
  post  '/welcome'        =>      'Cities#welcome'

  resources :cities, only: :show do
    member do
      get 'expiring'
    end
  end

  resources :vendors, only: :show do
    member do
      get 'expiring'
    end
  end

  resources :offers, only: :show

  namespace :admin do
    root to: 'pages#index'

    match '/login',       to:     'Sessions#new'
    match '/logout',      to:     'Sessions#destroy'
    match '/settings',    to:     'Vendors#edit'

    resources :offers
    resources :sessions,  only: [:new, :create, :destroy]
    # resources :vendors,   only: [:edit, :show, :update]
  end
end
