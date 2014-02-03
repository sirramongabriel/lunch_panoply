LunchPanoply::Application.routes.draw do
  devise_for :admins

  root to: 'static_pages#index'

  devise_for :employees, :controllers => { 
                                            :registration => "registration",
                                            :omniauth_callbacks => "omniauth_callbacks" 
                                         }

  resources :sessions, only: [:new, :create, :destroy, :failure]

  resources :identities

  match '/auth/:provider/callback', to: 'sessions#create'

  match '/signout' => 'sessions#destroy', as: :signout
  match '/signin' => 'sessions#new', as: :signin

  match '/auth/failure' => 'sessions#failure'

  # resources :companies
  # resources :employees
  # resources :comments
  # resources :menues
  # resources :menu_items

  resources :companies do
    resources :employees
  end

  resources :employees do
    resources :comments
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
