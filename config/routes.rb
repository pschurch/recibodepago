Recibodepago::Application.routes.draw do
  resources :payment_policies

  resources :users

  resources :groups

  resources :principals

  resources :collection_types

  resources :payment_agreements

  resources :payment_forms

  resources :products

  resources :profiles


  # root :to => "welcome#index"

 
end
