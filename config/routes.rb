Rails.application.routes.draw do
  resources :railway_stations do
    patch :update_position, on: :member
  end
  resources :trains do
    resources :carriages, shallow: true
    resources :seats_carriages, shallow: true
    resources :coupe_carriages, shallow:true
    resources :economy_carriages, shallow:true
    resources :sv_carriages, shallow: true
  end
  resources :routes
  resources :tickets
  resources :users
  get 'welcome/index'

  
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
