LunchPanoply::Application.routes.draw do
  devise_for :employees

  root to: 'static_pages#index'

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
