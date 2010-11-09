class PaymentFormsController < ApplicationController
  def index
    @payment_forms = PaymentForm.all
    @titulo = "Listado de Formas de Pago"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payment_forms }
    end
  end

  def show
    @payment_form = PaymentForm.find(params[:id])
    @titulo = "Ver Forma de Pago"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment_form }
    end
  end

  def new
    @payment_form = PaymentForm.new
    @titulo = "Crear Forma de Pago"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment_form }
    end
  end

  def edit
    @payment_form = PaymentForm.find(params[:id])
    @titulo = "Editar Forma de Pago"
    @perfil_name = "Administrador"
  end

  def create
    @payment_form = PaymentForm.new(params[:payment_form])

    respond_to do |format|
      if @payment_form.save
        format.html { redirect_to(@payment_form, :notice => 'La Forma de Pago se ha creado exitosamente.') }
        format.xml  { render :xml => @payment_form, :status => :created, :location => @payment_form }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment_form.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @payment_form = PaymentForm.find(params[:id])

    respond_to do |format|
      if @payment_form.update_attributes(params[:payment_form])
        format.html { redirect_to(@payment_form, :notice => 'La Forma de Pago se ha actualizado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment_form.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @payment_form = PaymentForm.find(params[:id])
    @payment_form.destroy

    respond_to do |format|
      format.html { redirect_to(payment_forms_url) }
      format.xml  { head :ok }
    end
  end
end
