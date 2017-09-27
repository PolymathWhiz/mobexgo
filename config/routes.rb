Rails.application.routes.draw do
  root to: 'forms#new'

  devise_for :admins

  devise_scope :admins do
    resources :admins, only: [:show]  
  end

  resources :forms, only: [:create, :new]
end
