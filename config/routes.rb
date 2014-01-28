LunchPanoply::Application.routes.draw do
  get "venues/index"

  get "venues/new"

  get "venues/create"

  get "venues/show"

  get "venues/edit"

  get "venues/update"

  get "venues/destroy"

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
