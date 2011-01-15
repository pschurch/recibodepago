class ReceiptsController < ApplicationController
  before_filter :perfil_name

  def create_rp
    @titulo = "Crear Recibo de Pago"
    @tickets = Ticket.order(params[:sort])

  end

  # GET /receipts
  def index
    @receipts = Receipt.all
    # index.html.erb
  end

  # GET /receipts/1
  def show
    @receipt = Receipt.find(params[:id])
    # show.html.erb
  end

  def new
    @receipt = Receipt.new
    @titulo = "Crear rp" + params[:r].to_s
    # new.html.erb
  end

  # GET /receipts/1/edit
  def edit
    @receipt = Receipt.find(params[:id])
  end

  # POST /receipts
  def create
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
      redirect_to(@receipt, :notice => 'Receipt was successfully updated.') 
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
