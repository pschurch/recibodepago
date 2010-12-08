class PaymentAgreementsController < ApplicationController
  before_filter :authenticate_adm

  def index
    @payment_agreements = PaymentAgreement.all
    @titulo = "Listado de Acuerdos de Pago"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payment_agreements }
    end
  end

  def show
    @payment_agreement = PaymentAgreement.find(params[:id])
    @titulo = "Ver Acuerdo de Pago"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment_agreement }
    end
  end

  def new
    @payment_agreement = PaymentAgreement.new
    @titulo = "Crear Acuerdo de Pago"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment_agreement }
    end
  end

  def edit
    @payment_agreement = PaymentAgreement.find(params[:id])
    @titulo = "Editar Acuerdo de Pago"
    @perfil_name = "Administrador"
  end

  def create
    @payment_agreement = PaymentAgreement.new(params[:payment_agreement])
    @titulo = "Crear Acuerdo de Pago"
    @perfil_name = "Administrador"
    respond_to do |format|
      if @payment_agreement.save
        format.html { redirect_to(@payment_agreement, :notice => 'El Acuerdo de Pago se ha creado exitosamente.') }
        format.xml  { render :xml => @payment_agreement, :status => :created, :location => @payment_agreement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment_agreement.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @payment_agreement = PaymentAgreement.find(params[:id])
    @titulo = "Editar Acuerdo de Pago"
    @perfil_name = "Administrador"
    respond_to do |format|
      if @payment_agreement.update_attributes(params[:payment_agreement])
        format.html { redirect_to(@payment_agreement, :notice => 'El Acuerdo de Pago se ha actualizado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment_agreement.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @payment_agreement = PaymentAgreement.find(params[:id])
    @payment_agreement.destroy

    respond_to do |format|
      format.html { redirect_to(payment_agreements_url) }
      format.xml  { head :ok }
    end
  end
end
