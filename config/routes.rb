LunchPanoply::Application.routes.draw do
  get "companies/index"

  get "companies/new"

  get "companies/create"

  get "companies/show"

  get "companies/edit"

  get "companies/update"

  get "companies/destroy"

  get "employees/index"

  get "employees/new"

  get "employees/create"

  get "employees/show"

  get "employees/edit"

  get "employees/update"

  get "employees/destroy"

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
