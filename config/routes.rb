Recibodepago::Application.routes.draw do
  resources :emitters

  get "supervisor/stmod"
  get "supervisor/stlist"
  get "supervisor/srlist"
  get "supervisor/sr_recp_cobr"
  get "supervisor/sr_envio_terreno"
  get "supervisor/sr_recp_terreno"
  get "supervisor/sr_rech_terreno"
  get "supervisor/sr_rend_tesoreria"
  get "supervisor/sr_rech_tesoreria"

  get "finance/ftlist"
  get "finance/frlist"
  get "finance/fhlist"
  get "finance/frmlist"

  get "manager/mtmod"
  get "manager/mtlist"
  get "manager/mrlist"

  match '/dcasos', :to => 'designer#casos'
  match '/dtickets', :to => 'designer#tickets'
  match '/dreceipts', :to => 'designer#receipts'
  match '/dprofiles', :to => 'designer#profiles'
  match '/dgroups', :to => 'designer#groups'
  match '/dprincipals', :to => 'designer#principals'
  match '/dusers', :to => 'designer#users'
  match '/dproducts', :to => 'designer#products'
  match '/dcollection_types', :to => 'designer#collection_types'
  match '/dpayment_forms', :to => 'designer#payment_forms'
  match '/dpayment_policies', :to => 'designer#payment_policies'
  match '/dpayment_agreements', :to => 'designer#payment_agreements'
  get "designer/del_reg"

  match '/listk', :to => 'receipts#create_rp'
  match '/lisra', :to => 'receipts#rp_abtos'
  match '/lisrr', :to => 'receipts#rp_rechz'
  match '/rnsup', :to => 'receipts#rend_sup'
  #resources :receipts
  resources :receipts do
    collection do
      post 'new2'
    end
  end

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
