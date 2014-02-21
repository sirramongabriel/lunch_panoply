LunchPanoply::Application.routes.draw do
  root to: 'static_pages#index'

  devise_for :admins

  devise_for :employees, 
             :controllers => { 
                               # :registration => "registration",
                               :omniauth_callbacks => "employees/omniauth_callbacks" 
                              }

  namespace :api_clients do
    resources :menu_items, defaults: { format: 'json' }
  end                           

  resources :companies

  resources :employees do
    resources :sessions
    resources :comments
    resources :favorites
    # resources :companies
  end

  # resources :companies do
  #   resources :employees
  # end

  resources :venues do
    resources :menus
  end
  
  resources :menus do
    resources :menu_items
  end

    # resources :sessions, only: [:new, :create, :destroy, :failure]
  # resources :identities
  # match '/auth/:provider/callback', to: 'sessions#create'

  # match '/signup',  to: 'employees#new', as: :sign_up
  # match '/signout', to: 'sessions#destroy', as: :signout
  # match '/signin',  to: 'sessions#new', as: :signin

  # match '/auth/failure', to: 'sessions#failure'

  # match ':controller(/:action(/:id))(.:format)'
end
