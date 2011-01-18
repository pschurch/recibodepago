class ReceiptsController < ApplicationController
  before_filter :perfil_name

  def rp_sup_ab
    @titulo = "Recibos de Pago Abiertos"
    @receipts = Receipt.where("state='abierto'").where("group_id=?", current_user.group_id)
  end

  def create_rp
    @titulo = "Crear Recibo de Pago"
    @tickets = Ticket.order(params[:sort])
  end

  # GET /receipts - index.html.erb
  def index
    @titulo = "Listado de Recibos de Pago"
    @receipts = Receipt.all
  end

  # GET /receipts/1 - show.html.erb
  def show
    @titulo = "Ver Recibo de Pago"
    @receipt = Receipt.find(params[:id])
  end

  # new.html.erb
  def new
    @titulo = "Crear Recibo de Pago"
    @receipt = Receipt.new
    @tickets = Ticket.where("id=?", params[:r])
  end

  # GET /receipts/1/edit
  def edit
    @titulo = "Editar Recibo de Pago"
    @receipt = Receipt.find(params[:id])
  end

  # POST /receipts
  def create
    @titulo = "Crear Recibo de Pago"
    @receipt = Receipt.new(params[:receipt])
    if @receipt.save
      redirect_to(@receipt, :notice => 'Receipt was successfully created.') 
    else
      render :action => "new" 
    end
  end

  # PUT /receipts/1
  def update
    @receipt = Receipt.find(params[:id])
    if @receipt.update_attributes(params[:receipt])
      redirect_to(@receipt, :notice => 'El Recibo de Pago se ha actualizado exitosamente.') 
    else
      render :action => "edit" 
    end
  end

  # DELETE /receipts/1
  def destroy
    @receipt = Receipt.find(params[:id])
    @receipt.destroy
    redirect_to(receipts_url) 
  end


  private
    def perfil_name
     if current_user.profile_id==1 
        @perfil_name = "Ejecutivo de Cobranza"
      elsif current_user.profile_id==2
        @perfil_name = "Supervisor"
      elsif current_user.profile_id==8
        @perfil_name = "Designer"
      end 
    end
end
