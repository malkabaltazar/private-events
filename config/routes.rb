Rails.application.routes.draw do
  root 'sessions#new'
  delete '/logout',  to: 'sessions#destroy'
  resources :users, only: [:show, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :events, only: [:index, :show, :new, :create]
  resources :event_attendances, only: :create
end
