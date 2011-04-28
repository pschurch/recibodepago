class PaymentPeriodsController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_adm 

  def index
    @payment_periods = PaymentPeriod.all
    @titulo = "Listado de Periodos de Pago"
  end

  def show
    @payment_period = PaymentPeriod.find(params[:id])
    @titulo = "Ver Periodo de Pago"
  end

  def new
    @payment_period = PaymentPeriod.new
    @titulo = "Crear Periodo de Pago"
  end

  def edit
    @payment_period = PaymentPeriod.find(params[:id])
    @titulo = "Editar Periodo de Pago"
  end

  def create
    @payment_period = PaymentPeriod.new(params[:payment_period])
    @titulo = "Crear Periodo de Pago"
    if @payment_period.save
      redirect_to(@payment_period, :notice => 'El Periodo de Pago se ha creado exitosamente.') 
    else
      render :action => "new" 
    end
  end

  def update
    @payment_period = PaymentPeriod.find(params[:id])
    @titulo = "Editar Periodo de Pago"
    if @payment_period.update_attributes(params[:payment_period])
      redirect_to(@payment_period, :notice => 'El Periodo de Pago se ha actualizado exitosamente.') 
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
