LunchPanoply::Application.routes.draw do
  get "employees/index"

  get "employees/new"

  get "employees/create"

  get "employees/show"

  get "employees/edit"

  get "employees/update"

  get "employees/destroy"

  resources :companies do
    resources :employees
  end

  resources :employees, shallow: true do
    resources :comments
    resources :favorites
  end

  resources :venues, shallow: true do
    resources :menus
  end
  
  resources :menus, shollow: true do
    resources :menu_items
  end
  # match ':controller(/:action(/:id))(.:format)'
end
