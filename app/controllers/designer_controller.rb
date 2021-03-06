class DesignerController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_dsg
  helper_method :sort_column, :sort_direction  

  def del_reg
    @titulo = "Notificacion"
    @id = params[:id]
    @reg = params[:reg]
    if params[:co] 
      case params[:reg]
         when "caso"
           @caso = Assignment.find(params[:id])
           @caso.destroy
           redirect_to(:action => 'casos')
         when "collection_type"
           @collection_type = CollectionType.find(params[:id])
           @collection_type.destroy
           redirect_to(:action => 'collection_types')
         when "group"
           @group = Group.find(params[:id])
           @group.destroy
           redirect_to(:action => 'groups')
         when "payment_agreement"
           @payment_agreement = PaymentAgreement.find(params[:id])
           @payment_agreement.destroy
           redirect_to(:action => 'payment_agreements')
         when "payment_form"
           @payment_form = PaymentForm.find(params[:id])
           @payment_form.destroy
           redirect_to(:action => 'payment_forms')
         when "payment_policie"
           @payment_policie = PaymentPolicy.find(params[:id])
           @payment_policie.destroy
           redirect_to(:action => 'payment_policies')
         when "principal"
           @principal = Principal.find(params[:id])
           @principal.destroy
           redirect_to(:action => 'principals')
         when "product"
           @product = Product.find(params[:id])
           @product.destroy
           redirect_to(:action => 'products')
         when "profile"
           @profile = Profile.find(params[:id])
           @profile.destroy
           redirect_to(:action => 'profiles')
         when "receipt"
           @receipt = Receipt.find(params[:id])
           @receipt.destroy
           redirect_to(:action => 'receipts')
         when "ticket"
           @ticket = Ticket.find(params[:id])
           @ticket.destroy
           redirect_to(:action => 'tickets')
         when "field_user"
           @field_user = FieldUser.find(params[:id])
           @field_user.destroy
           redirect_to(:action => 'field_users')
         when "user"
           @user = User.find(params[:id])
           @user.destroy
           redirect_to(:action => 'users')
      end
    end
  end

  def casos
    @titulo = "Listado de Casos"
    @assignments = Assignment.order(sort_column + ' ' + sort_direction)  
  end

  def collection_types
    @titulo = "Listado de Tipos de Cobranza"
    @collection_types = CollectionType.order(sort_column + ' ' + sort_direction) 
  end

  def groups
    @titulo = "Listado de Grupos"
    @groups = Group.order(sort_column + ' ' + sort_direction) 
  end

  def payment_agreements
    @titulo = "Listado de Acuerdos de Pago"
    @payment_agreements = PaymentAgreement.order(sort_column + ' ' + sort_direction) 
  end

  def payment_forms
    @titulo = "Listado de Formas de Pago"
    @payment_forms = PaymentForm.order(sort_column + ' ' + sort_direction) 
  end

  def payment_policies
    @titulo = "Listado de Politicas de Pago"
    @payment_policies = PaymentPolicy.order(sort_column + ' ' + sort_direction) 
  end

  def principals
    @titulo = "Listado de Mandantes"
    @principals = Principal.order(sort_column + ' ' + sort_direction) 
  end

  def products
    @titulo = "Listado de Productos"
    @products = Product.order(sort_column + ' ' + sort_direction) 
  end

  def profiles
    @titulo = "Listado de Perfiles"
    @profiles = Profile.order(sort_column + ' ' + sort_direction) 
  end

  def receipts 
    @titulo = "Listado de Recibos de Pago"
    @receipts = Receipt.order(sort_column + ' ' + sort_direction) 
  end

  def tickets
    @titulo = "Listado de Tickets"
    @tickets = Ticket.order(sort_column + ' ' + sort_direction) 
  end

  def users
    @titulo = "Listado de Usuarios"
    @users = User.order(sort_column + ' ' + sort_direction) 
  end

  def field_users
    @titulo = "Listado de Ejecutivos de Terreno"
    @field_users = FieldUser.order(sort_column + ' ' + sort_direction) 
  end

  def payment_flows
    @titulo = "Listado de Flujos de Pago"
    @payment_flows = PaymentFlow.order(sort_column + ' ' + sort_direction) 
  end

  def parameters
    @titulo = "Listado de Parametros"
    @parameters = Parameter.order(sort_column + ' ' + sort_direction) 
  end
  def comunas
    @titulo = "Listado de Comunas"
    @comunas = Comuna.order(sort_column + ' ' + sort_direction) 
  end
  def emitters
    @titulo = "Listado de Emisores"
    @emitters = Emitter.order(sort_column + ' ' + sort_direction) 
  end
  def payment_periods
    @titulo = "Listado de Periodos de Pago"
    @payment_periods = PaymentPeriod.order(sort_column + ' ' + sort_direction) 
  end

  def sort_column  
    params[:sort] || "id"  
  end  
  def sort_direction  
    params[:direction] || "asc"  
  end 

  private
    def perfil_name
      @perfil_name = "Designer"
    end

end
