LunchPanoply::Application.routes.draw do
  devise_for :admins

  root to: 'static_pages#index'

  devise_for :employees, 
             :controllers => { 
                                :registration => "registration",
                                :omniauth_callbacks => "employees/omniauth_callbacks" 
                              }

  resources :sessions, only: [:new, :create, :destroy, :failure]

  resources :identities

  match '/auth/:provider/callback', to: 'sessions#create'

  match '/signup',  to: 'employees#new', as: :sign_up
  match '/signout', to: 'sessions#destroy', as: :signout
  match '/signin',  to: 'sessions#new', as: :signin

  match '/auth/failure', to: 'sessions#failure'

  resources :companies
  # resources :employees
  resources :comments
  resources :menus
  # resources :menu_items

  resources :employees do
    resources :sessions
    # resources :companies
    # resources :comments
    resources :favorites
  end

  resources :venues do
    resources :menus
  end
  
  resources :menus do
    resources :menu_items
  end
  # match ':controller(/:action(/:id))(.:format)'
end
