Economy::Application.routes.draw do
  resources :points

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end