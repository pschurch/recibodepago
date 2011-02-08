Recibodepago::Application.routes.draw do
  get "supervisor/stmod"
  get "supervisor/stlist"
  get "supervisor/srlist"

  get "finance/ftlist"
  get "finance/frlist"
  get "finance/fhlist"
  get "finance/frmlist"

  get "manager/mtmod"
  get "manager/mtlist"
  get "manager/mrlist"

  get "designer/cdsg"
  get "designer/tdsg"
  get "designer/rdsg"

  match '/lisrsr', :to => 'receipts#rp_sup_rch'
  match '/lisrsa', :to => 'receipts#rp_sup_ab'
  match '/listk', :to => 'receipts#create_rp'
  resources :receipts

  get "tickets/ntc"
  match '/search', :to => 'tickets#search'
  match '/list', :to => 'tickets#cases'
  resources :tickets

  resources :profiles
  resources :payment_policies
  resources :users
  resources :groups
  resources :principals
  resources :collection_types
  resources :payment_agreements
  resources :payment_forms
  resources :products

  #Ingreso a la Aplicacion
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
  root :to => "sessions#new"

end
