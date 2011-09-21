Mira::Application.routes.draw do
  root :to => 'home#index'

  resources :items
  put "hide_item" => "items#hide", :as => "hide_item"

  resources :lists
  put "hide_list" => "lists#hide", :as => "hide_list"

  resources :users
  get "users/new"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  
  resources :sessions
  get "sessions/new"
  
  #get "home/index"
end
