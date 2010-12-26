class PaymentPoliciesController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_adm

  def index
    @payment_policies = PaymentPolicy.all
    @titulo = "Listado de Politicas de Pago"
  end

  def show
    @payment_form_list = PaymentForm.find(:all)
    @payment_policy = PaymentPolicy.find(params[:id])
    @titulo = "Ver Politica de Pago"
  end

  def new
    @payment_policy = PaymentPolicy.new
    @titulo = "Crear Politica de Pago"
  end

  def edit
    @payment_policy = PaymentPolicy.find(params[:id])
    @titulo = "Editar Politica de Pago"
  end

  def create
    @payment_policy = PaymentPolicy.new(params[:payment_policy])
    @titulo = "Crear Politica de Pago"
    if @payment_policy.save
      redirect_to(@payment_policy, :notice => 'La Politica de Pago se ha creado exitosamente.')
    else
      render :action => "new"
    end
  end

  def update
    params[:payment_policy][:payment_form_ids] ||= []
    @payment_policy = PaymentPolicy.find(params[:id])
    @titulo = "Editar Politica de Pago"
    if @payment_policy.update_attributes(params[:payment_policy])
      redirect_to(@payment_policy, :notice => 'La Politica de Pago se ha actualizado exitosamente.')
    else
      render :action => "edit" 
    end
  end

  def destroy
    @payment_policy = PaymentPolicy.find(params[:id])
    @payment_policy.destroy
    redirect_to(payment_policies_url)
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
