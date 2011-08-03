Recibodepago::Application.routes.draw do
  #resources :remesas
  resources :remesas do
    collection do
      post 'new2'
    end
  end

  resources :rejection_types

  resources :cancellations

  resources :field_users

  get "terreno/trlist"
  get "terreno/trrecp"
  get "terreno/trcerr"
  get "terreno/ttlist"

  get "supervisor/stmod"
  get "supervisor/stlist"
  get "supervisor/srlist"
  get "supervisor/sanular"
  get "supervisor/sajustar"

  get "finance/ftlist"
  get "finance/frlist"
  get "finance/frmmp"
  get "finance/frmnew"
  get "finance/fhlist"
  get "finance/frmlist"

  get "manager/mtmod"
  get "manager/mtlist"
  get "manager/mrlist"

  match '/dfield_users', :to => 'designer#field_users'
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
  match '/dpayment_flows', :to => 'designer#payment_flows'
  match '/dparameters', :to => 'designer#parameters'
  match '/dcomunas', :to => 'designer#comunas'
  match '/demitters', :to => 'designer#emitters'
  match '/dpayment_periods', :to => 'designer#payment_periods'
  get "designer/del_reg"

  get "receipts/ejc"
  get "receipts/sup"
  get "receipts/jtr"
  get "receipts/ger"
  get "receipts/tsr"
  get "receipts/ntc"
  get "receipts/print"
  match '/listk', :to => 'receipts#create_rp'
  match '/lisra', :to => 'receipts#rp_abtos'
  #resources :receipts
  resources :receipts do
    collection do
      post 'sup_edit_multiple'
      put 'sup_update_multiple'                                 
    end
    collection do
      post 'ejc_edit_multiple'
      put 'ejc_update_multiple'                                  
    end
    collection do
      post 'jtr_edit_multiple'
      put 'jtr_update_multiple'                                  
    end
    collection do
      post 'ger_edit_multiple'
      put 'ger_update_multiple'                                  
    end
    collection do
      post 'tsr_edit_multiple'
      put 'tsr_update_multiple'                                  
    end
  end
  resources :receipts do
    collection do
      post 'new2'
    end
  end

  get "tickets/ntc"
  match '/search', :to => 'tickets#search'
  match '/list', :to => 'tickets#cases'
  resources :tickets

  resources :parameters
  resources :payment_periods
  resources :payment_flows
  resources :emitters
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
