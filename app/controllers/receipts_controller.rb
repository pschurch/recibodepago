class ReceiptsController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate
  helper_method :sort_column, :sort_direction  

  def create_rp
    deny_access unless (current_user.profile_id == 1)
    session[:ticket_ids] = nil
    @titulo = "Crear Recibo de Pago"
    grupo = current_user.group_id
    @tickets = Ticket.where("state='creado' OR state='modificado'").where("group_id=?", grupo).order(sort_column + ' ' + sort_direction)  
    @msg = params[:msg]
  end

  # GET /receipts - index.html.erb
  def index
    deny_access unless (current_user.profile_id == 1)
    @titulo = "Listado de Recibos de Pago"
    @t=Time.now
    params[:area].nil? ? @area = 'Todas' : @area = params[:area]
    params[:estado].nil? ? @estado = 'Todos' : @estado = params[:estado]
    if (params[:estado]=='Todos' or params[:estado].nil? )
      @receipts = Receipt.all
    else
      @receipts = Receipt.where("state=?", params[:estado])
    end
  end

  # GET /receipts/1 - show.html.erb
  def show
    @titulo = "Ver Recibo de Pago"
    @receipt = Receipt.find(params[:id])
    @tickets = Ticket.where("receipt_id=?", @receipt.id)
  end

  #-------------- new2.html.erb ------------------
  def new2
    if params[:ticket_ids].nil?
      @tickets = Ticket.all
      redirect_to(:action => "create_rp", :msg => "Debe seleccionar al menos un Ticket" )
    else
      @titulo = "Crear Recibo de Pago-new"
      session[:receipt_step] = nil
      @receipt = Receipt.new
      session[:ticket_ids] = params[:ticket_ids]
      @tickets = Ticket.find(params[:ticket_ids])
      @total_rp = 0
      @tickets.each do |a|
        if a.adjust.nil?
          @total_rp = @total_rp + a.total_pay
        else
          @total_rp = @total_rp + a.new_total_pay
        end
      end
    end
  end

  #------------ POST /receipts --------------------
  def create
    @titulo = "Crear Recibo de Pago-create"
    @tickets = Ticket.find(session[:ticket_ids])
    @receipt = Receipt.new(params[:receipt])  
    @receipt.current_step = session[:receipt_step]  
    for a in PaymentAgreement.where("id =?", @receipt.payment_agreement_id) 
      @payment_agreement = a.name
    end 
    @total_rp = 0
    @tickets.each do |a|
      if a.adjust.nil?
        @total_rp = @total_rp + a.total_pay
      else
        @total_rp = @total_rp + a.new_total_pay
      end
    end
    if params[:next_button]     
      @receipt.next_step  
    elsif params[:rec_button]  
      @receipt.save 
    end  
    session[:receipt_step] = @receipt.current_step  
    if @receipt.new_record?  
      render :action => "new2"  
    else 
      @receipt.update_attribute 'group_id', current_user.group_id
      @tickets.each do |a|
        a.update_attribute 'receipt_id', @receipt.id
        a.update_attribute 'state', 'recibo creado'
        @caso = Assignment.where("ticket_id =?", a.id)
        @caso.each do |c|
          c.update_attribute 'state', "rp_creado"
          c.update_attribute 'receipt_id', @receipt.id
        end
      end
      session[:tickets_ids] = nil
      if @receipt.payment_agreement_id==3 # Gestiona Eje Cobranza
        redirect_to(@receipt, :notice => 'El Recibo de Pago se ha creado exitosamente y se encuentra listo para ser impreso.') 
      elsif @receipt.payment_agreement_id==4 # Gestion en Terreno
        @receipt.update_attribute 'state', 'solicita gestion terreno'
        redirect_to(@receipt, :notice => 'El Recibo de Pago se ha creado exitosamente y se encuentra listo para ser gestionado en terreno.') 
      else
        redirect_to(@receipt, :notice => 'El Recibo de Pago se ha cerrado exitosamente y se encuentra listo para ser rendido.')     
      end


    end  

    
#    if not session[:tickets].nil?

#      @total_paid = 0
#      @total_paid = (not @receipt.monto1.nil?) ? @total_paid + @receipt.monto1 : @total_paid
#      @total_paid = (not @receipt.monto2.nil?) ? @total_paid + @receipt.monto2 : @total_paid
#      @total_paid = (not @receipt.monto3.nil?) ? @total_paid + @receipt.monto3 : @total_paid
#      @total_paid = (not @receipt.monto4.nil?) ? @total_paid + @receipt.monto4 : @total_paid
#      @total_paid = (not @receipt.monto5.nil?) ? @total_paid + @receipt.monto5 : @total_paid
#      @total_paid = (not @receipt.monto6.nil?) ? @total_paid + @receipt.monto6 : @total_paid
#      if @receipt.save
#
#        @receipt.update_attribute 'total_paid', @total_paid
#        @tickets.each do |a|
#          a.update_attribute 'receipt_id', @receipt.id
#          a.update_attribute 'state', 'recibo creado'
#        end
#        session[:tickets_ids] = nil
#        redirect_to(@receipt, :notice => '1') 
#      else
#        render :action => "new2" 
#      end
#    else
#      render :action => "new2" 
#    end
  end


  # GET /receipts/1/edit
  def edit
    @titulo = "Editar Recibo de Pago"
    @receipt = Receipt.find(params[:id])
    @tickets = Ticket.where("receipt_id=?", @receipt.id)
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

  def rp_abtos
    deny_access unless (current_user.profile_id == 1)
    @titulo = "Recibos de Pago Abiertos"
    @receipts = Receipt.where("state='abierto'").where("group_id=?", current_user.group_id)
  end

  def rp_rechz
    deny_access unless (current_user.profile_id == 1)
    @titulo = "Recibos de Pago Rechazados"
    @receipts = Receipt.where("state='rechaza supervisor a cobranza' OR state='acepta cobranza rechazo supervisor'").where("group_id=?", current_user.group_id)
  end

  def rend_sup
    deny_access unless (current_user.profile_id == 1)
    @titulo = "Rendir Recibos de Pago a Supervisor"
  end

  def destroy
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
