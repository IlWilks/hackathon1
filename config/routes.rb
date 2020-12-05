Rails.application.routes.draw do
  root 'static#home'
  devise_for :users
    
  # get '/users/sign_out' to: 'devise/sessions#destroy'
  

  resources :trips do
    resources :locations
  end

  resources :locations do
    resources :addresses
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
