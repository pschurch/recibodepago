class PaymentPoliciesController < ApplicationController
  def index
    @payment_policies = PaymentPolicy.all
    @titulo = "Listado de Politicas de Pago"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payment_policies }
    end
  end

  def show
    @payment_policy = PaymentPolicy.find(params[:id])
    @titulo = "Ver Politica de Pago"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment_policy }
    end
  end

  def new
    @payment_policy = PaymentPolicy.new
    @titulo = "Crear Politica de Pago"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment_policy }
    end
  end

  def edit
    @payment_policy = PaymentPolicy.find(params[:id])
    @titulo = "Editar Politica de Pago"
    @perfil_name = "Administrador"
  end

  def create
    @payment_policy = PaymentPolicy.new(params[:payment_policy])
    @titulo = "Crear Politica de Pago"
    @perfil_name = "Administrador"
    respond_to do |format|
      if @payment_policy.save
        format.html { redirect_to(@payment_policy, :notice => 'La Politica de Pago se ha creado exitosamente.') }
        format.xml  { render :xml => @payment_policy, :status => :created, :location => @payment_policy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment_policy.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @payment_policy = PaymentPolicy.find(params[:id])
    @titulo = "Editar Politica de Pago"
    @perfil_name = "Administrador"
    respond_to do |format|
      if @payment_policy.update_attributes(params[:payment_policy])
        format.html { redirect_to(@payment_policy, :notice => 'La Politica de Pago se ha actualizado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment_policy.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @payment_policy = PaymentPolicy.find(params[:id])
    @payment_policy.destroy

    respond_to do |format|
      format.html { redirect_to(payment_policies_url) }
      format.xml  { head :ok }
    end
  end
end
