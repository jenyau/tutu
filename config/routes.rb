Rails.application.routes.draw do
  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_arrival, on: :member
    patch :update_departure, on: :member
  end
  resources :trains do
    resources :carriages, shallow: true
    resources :seats_carriages, shallow: true
    resources :coupe_carriages, shallow:true
    resources :economy_carriages, shallow:true
    resources :sv_carriages, shallow: true
  end
  resources :routes do
    get :time_edit, on: :member
  end
  resources :users do
    resources :tickets, shallow: true
    resource :search, only: [:new, :show], shallow: true
  end
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
