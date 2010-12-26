class PaymentFormsController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_adm 
  
  def index
    @payment_forms = PaymentForm.all
    @titulo = "Listado de Formas de Pago"
  end

  def show
    @payment_form = PaymentForm.find(params[:id])
    @titulo = "Ver Forma de Pago"
  end

  def new
    @payment_form = PaymentForm.new
    @titulo = "Crear Forma de Pago"
  end

  def edit
    @payment_form = PaymentForm.find(params[:id])
    @titulo = "Editar Forma de Pago"
  end

  def create
    @payment_form = PaymentForm.new(params[:payment_form])
    @titulo = "Crear Forma de Pago"
    if @payment_form.save
      redirect_to(@payment_form, :notice => 'La Forma de Pago se ha creado exitosamente.') 
    else
      render :action => "new" 
    end
  end

  def update
    @payment_form = PaymentForm.find(params[:id])
    @titulo = "Editar Forma de Pago"
    if @payment_form.update_attributes(params[:payment_form])
      redirect_to(@payment_form, :notice => 'La Forma de Pago se ha actualizado exitosamente.') 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @payment_form = PaymentForm.find(params[:id])
    @payment_form.destroy
    redirect_to(payment_forms_url) 
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
