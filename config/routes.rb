Recibodepago::Application.routes.draw do
  #get "sessions/new"
  resources :sessions, :only => [:new, :create, :destroy]
  match '/salir', :to => 'sessions#destroy'

  resources :payment_policies
  resources :users
  resources :groups
  resources :principals
  resources :collection_types
  resources :payment_agreements
  resources :payment_forms
  resources :products
  resources :profiles

  root :to => "sessions#new"
 
end
