class ReceiptsController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate
  helper_method :sort_column, :sort_direction  

  def create_rp
    deny_access unless (current_user.profile_id == 1)
    @titulo = "Crear Recibo de Pago"
    grupo = current_user.group_id
    @tickets = Ticket.where("state='creado' OR state='modificado'").where("group_id=?", grupo).order(sort_column + ' ' + sort_direction)  

  end

  def rp_abtos
    deny_access unless (current_user.profile_id == 1)
    @titulo = "Recibos de Pago Abiertos"
    @receipts = Receipt.where("state='abierto'").where("group_id=?", current_user.group_id)
  end

  def rp_rechz
    deny_access unless (current_user.profile_id == 1)
    @titulo = "Recibos de Pago Rechazados"
    @receipts = Receipt.where("state='rsac' OR state='acrs'").where("group_id=?", current_user.group_id)
  end

  def rend_sup
    deny_access unless (current_user.profile_id == 1)
    @titulo = "Rendir Recibos de Pago a Supervisor"
  end

  # GET /receipts - index.html.erb
  def index
    deny_access unless (current_user.profile_id == 1)
    @titulo = "Listado de Recibos de Pago"
    @receipts = Receipt.all
  end

  # GET /receipts/1 - show.html.erb
  def show
    @titulo = "Ver Recibo de Pago"
    @receipt = Receipt.find(params[:id])
    @tickets = Ticket.where("receipt_id", @receipt.id)

@var="RP:" + @receipt.id.to_s + " T:"
    @tickets.each do |a|
       @var = @var + a.id.to_s
    end
  end

  #-------------- new.html.erb ------------------
  def new
    @titulo = "Crear Recibo de Pago-new"
    if params[:r].nil?
      session[:tickets] = nil
    else
      if session[:tickets].nil?
        session[:tickets] = params[:r]
      end
      @tickets = Ticket.where("id=?", session[:tickets])   
    end
    @receipt = Receipt.new
    @total_rp = 0
    @tickets.each do |a|
      if a.adjust.nil?
        @total_rp = @total_rp + a.total_pay
      else
        @total_rp = @total_rp + a.new_total_pay
      end
    end
  end

  #------------ POST /receipts --------------------
  def create
    @titulo = "Crear Recibo de Pago-create"
    @receipt = Receipt.new(params[:receipt])
    if not session[:tickets].nil?
      @tickets = Ticket.where("id=?", session[:tickets])   
      @total_rp = 0
      @tickets.each do |a|
        if a.adjust.nil?
          @total_rp = @total_rp + a.total_pay
        else
          @total_rp = @total_rp + a.new_total_pay
        end
      end
      @total_paid = 0
      @total_paid = (not @receipt.monto1.nil?) ? @total_paid + @receipt.monto1 : @total_paid
      @total_paid = (not @receipt.monto2.nil?) ? @total_paid + @receipt.monto2 : @total_paid
      @total_paid = (not @receipt.monto3.nil?) ? @total_paid + @receipt.monto3 : @total_paid
      @total_paid = (not @receipt.monto4.nil?) ? @total_paid + @receipt.monto4 : @total_paid
      @total_paid = (not @receipt.monto5.nil?) ? @total_paid + @receipt.monto5 : @total_paid
      @total_paid = (not @receipt.monto6.nil?) ? @total_paid + @receipt.monto6 : @total_paid

      if @receipt.save
        @receipt.update_attribute 'group_id', current_user.group_id
        @receipt.update_attribute 'total_paid', @total_paid
        @tickets.each do |a|
          a.update_attribute 'receipt_id', @receipt.id
        end


        session[:tickets] = nil
        redirect_to(@receipt, :notice => '1') 
      else
        render :action => "new" 
      end
    else
      render :action => "new" 
    end
  end

  # GET /receipts/1/edit
  def edit
    @titulo = "Editar Recibo de Pago"
    @receipt = Receipt.find(params[:id])
    @tickets = Ticket.where("id=?", 80)
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

  def sort_column  
    params[:sort] || "id"  
  end  
  def sort_direction  
    params[:direction] || "asc"  
  end  

  private
    def perfil_name
     if current_user.profile_id==1 
        @perfil_name = "Ejecutivo de Cobranza"
      elsif current_user.profile_id==2
        @perfil_name = "Supervisor"
      elsif current_user.profile_id==3
        @perfil_name = "Jefe de Terreno"
      elsif current_user.profile_id==4
        @perfil_name = "Tesoreria"
      elsif current_user.profile_id==5
        @perfil_name = "Operador"
      elsif current_user.profile_id==6
        @perfil_name = "Gerencia"
      elsif current_user.profile_id==8
        @perfil_name = "Designer"
      end 
    end
end
