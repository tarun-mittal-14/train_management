Rails.application.routes.draw do
  root 'trains#index'
  devise_for :users
  
 resources :trains do
  resources :bookings
end
end