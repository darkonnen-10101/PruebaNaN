Rails.application.routes.draw do

  get 'states/create'
  resources :tasks, only: :index do
    resources :states, only: :create
  end

  devise_for :users
  root to: 'tasks#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
