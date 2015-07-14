Rails.application.routes.draw do
  root 'teams#new'
  resources :teams
  resources :authors
end
