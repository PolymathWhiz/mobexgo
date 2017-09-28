Rails.application.routes.draw do
  root to: 'forms#new'
  
  devise_for :admins
  
  devise_scope :admin do
    resources :admins, only: [:show]
  end

  resources :forms, only: [:create, :new]
end
