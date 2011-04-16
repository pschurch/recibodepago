class PaymentFlowsController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_adm 

  def index
    @payment_flows = PaymentFlow.all
    @titulo = "Listado de Flujos de Pago"
  end

  def show
    @payment_flow = PaymentFlow.find(params[:id])
    @titulo = "Ver Flujo de Pago"
  end

  def new
    @payment_flow = PaymentFlow.new
    @titulo = "Crear Flujo de Pago "
  end

  def edit
    @payment_flow = PaymentFlow.find(params[:id])
    @titulo = "Editar Flujo de Pago"
  end

  def create
    @payment_flow = PaymentFlow.new(params[:payment_flow])
    if @payment_flow.save
      redirect_to(@payment_flow, :notice => 'El Flujo de Pago se ha creado exitosamente.') 
    else
      render :action => "new" 
    end
  end

  def update
    @payment_flow = PaymentFlow.find(params[:id])
    @titulo = "Editar Flujo de Pago"
    if @payment_flow.update_attributes(params[:profile])
      redirect_to(@payment_flow, :notice => 'El Flujo de Pago se ha actualizado exitosamente.') 
    else
      render :action => "edit" 
    end
  end

  def destroy
  end

  private
    def perfil_name
      if current_user.profile_id==7 
        @perfil_name = "Administrador"
      elsif current_user.profile_id==8
        @perfil_name = "Designer"
      end
    end

end
