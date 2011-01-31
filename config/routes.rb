Recibodepago::Application.routes.draw do
  resources :profiles

  match '/lisrsr', :to => 'receipts#rp_sup_rch'
  match '/lisrsa', :to => 'receipts#rp_sup_ab'
  match '/listk', :to => 'receipts#create_rp'
  resources :receipts

  match '/search', :to => 'tickets#search'
  match '/list', :to => 'tickets#cases'
  match '/changsp', :to => 'tickets#mod_sup'
  resources :tickets

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
  root :to => "sessions#new"
 
end
