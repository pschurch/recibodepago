class PaymentAgreementsController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_adm 
  
  def index
    @payment_agreements = PaymentAgreement.all
    @titulo = "Listado de Acuerdos de Pago"
  end

  def show
    @payment_agreement = PaymentAgreement.find(params[:id])
    @titulo = "Ver Acuerdo de Pago"
  end

  def new
    @payment_agreement = PaymentAgreement.new
    @titulo = "Crear Acuerdo de Pago"
  end

  def edit
    @payment_agreement = PaymentAgreement.find(params[:id])
    @titulo = "Editar Acuerdo de Pago"
  end

  def create
    @payment_agreement = PaymentAgreement.new(params[:payment_agreement])
    @titulo = "Crear Acuerdo de Pago"
    if @payment_agreement.save
      redirect_to(@payment_agreement, :notice => 'El Acuerdo de Pago se ha creado exitosamente.') 
    else
      render :action => "new" 
    end
  end

  def update
    @payment_agreement = PaymentAgreement.find(params[:id])
    @titulo = "Editar Acuerdo de Pago"
    if @payment_agreement.update_attributes(params[:payment_agreement])
      redirect_to(@payment_agreement, :notice => 'El Acuerdo de Pago se ha actualizado exitosamente.') 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @payment_agreement = PaymentAgreement.find(params[:id])
    @payment_agreement.destroy
    redirect_to(payment_agreements_url) 
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
