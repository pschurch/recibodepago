Recibodepago::Application.routes.draw do
  resources :tickets
  match '/search', :to => 'tickets#search'
  match '/list', :to => 'tickets#cases'
  match '/listk', :to => 'tickets#create_rp'

  #get "sessions/new"
  resources :sessions, :only => [:new, :create, :destroy]
  match '/salir', :to => 'sessions#destroy'
  get "sessions/ejc"
  get "sessions/sup"
  get "sessions/jtr"
  get "sessions/tsr"
  get "sessions/opr"
  get "sessions/ger"
  get "sessions/adm"
  get "sessions/dsg"

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
