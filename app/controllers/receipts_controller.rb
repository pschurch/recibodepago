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
    if not params[:msg].nil?
      case params[:msg]
        when "1"
        @msg = "Debe seleccionar al menos un Ticket"
        when "2"
        @msg = "No se puede crear un mismo Recibo de Pago para diferentes Mandantes" 
        when "3"
        @msg = "No se puede crear un mismo Recibo de Pago para diferentes Productos" 
        when "4"
        @msg = "No se puede crear un mismo Recibo de Pago para diferentes Tipos de Cobranza" 
      end
    end
  end

  def index
    deny_access unless (current_user.profile_id == 1)
    @titulo = "Listado de Recibos de Pago"
    @t=Time.now

    params[:area].nil? ? @area = 'Todas' : @area = params[:area]
    params[:estado].nil? ? @estado = 'Todos' : @estado = params[:estado]

    if (@area=='Todas' and @estado=='Todos')
      @receipts = Receipt.all
    elsif (@area=='Todas' and @estado!='Todos')
      @receipts = Receipt.where("state=?", @estado)
    elsif (@area!='Todas' and @estado=='Todos')
      @receipts = Receipt.where("area=?", @area)
    else
      @receipts = Receipt.where("area=?", @area).where("state=?", @estado)
    end
  end

  def show
    @titulo = "Ver Recibo de Pago"
    @receipt = Receipt.find(params[:id])
    @tickets = Ticket.where("receipt_id=?", @receipt.id)
  end

  #-------------- new2.html.erb ------------------
  def new2
    if params[:ticket_ids].nil?
      #@tickets = Ticket.all
      redirect_to(:action => "create_rp", :msg => "1" ) #"Debe seleccionar al menos un Ticket"
    else
      session[:ticket_ids] = params[:ticket_ids]
      @tickets = Ticket.find(params[:ticket_ids])
      @mandante = @tickets.first.principal_id
      @producto = @tickets.first.product_id
      @tipo_cobranza = @tickets.first.collection_type_id
      @tickets.each do |a|
        if not(a.principal_id == @mandante)
          @msg =  "2"  #"No se puede crear un solo Recibo de Pago para diferentes Mandantes"
        elsif not(a.product_id == @producto)
          @msg = "3"  #"No se puede crear un solo Recibo de Pago para diferentes Productos"
        elsif not(a.collection_type_id == @tipo_cobranza)
          @msg = "4"  #"No se puede crear un solo Recibo de Pago para diferentes Tipos de Cobranza"
        end
      end
      if not @msg.nil?
        redirect_to(:action => "create_rp", :msg => @msg )
      end
      @titulo = "Crear Recibo de Pago-new"
      session[:receipt_step] = nil
      @receipt = Receipt.new
      session[:nuevo] = true
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
    @titulo = "Crear Recibo de Pago"
    @tickets = Ticket.find(session[:ticket_ids])
    @receipt = Receipt.new(params[:receipt])  
    @receipt.current_step = session[:receipt_step]  
    for a in PaymentAgreement.where("id =?", @receipt.payment_agreement_id) 
      @payment_agreement = a.name
      @payment_flow = a.payment_flow_id
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
      if (not session[:tickets].nil?) 
        @total_paid = 0
        @total_paid = (not @receipt.monto1.nil?) ? @total_paid + @receipt.monto1 : @total_paid
        @total_paid = (not @receipt.monto2.nil?) ? @total_paid + @receipt.monto2 : @total_paid
        @total_paid = (not @receipt.monto3.nil?) ? @total_paid + @receipt.monto3 : @total_paid
        @total_paid = (not @receipt.monto4.nil?) ? @total_paid + @receipt.monto4 : @total_paid
        @total_paid = (not @receipt.monto5.nil?) ? @total_paid + @receipt.monto5 : @total_paid
        @total_paid = (not @receipt.monto6.nil?) ? @total_paid + @receipt.monto6 : @total_paid
        @total_paid = (not @receipt.monto7.nil?) ? @total_paid + @receipt.monto7 : @total_paid
        @total_paid = (not @receipt.monto8.nil?) ? @total_paid + @receipt.monto8 : @total_paid
        @total_paid = (not @receipt.monto9.nil?) ? @total_paid + @receipt.monto9 : @total_paid
        @total_paid = (not @receipt.monto10.nil?) ? @total_paid + @receipt.monto10 : @total_paid
        @total_paid = (not @receipt.monto11.nil?) ? @total_paid + @receipt.monto11 : @total_paid
        @total_paid = (not @receipt.monto12.nil?) ? @total_paid + @receipt.monto12 : @total_paid
        @total_paid = (not @receipt.monto13.nil?) ? @total_paid + @receipt.monto13 : @total_paid
        @total_paid = (not @receipt.monto14.nil?) ? @total_paid + @receipt.monto14 : @total_paid
        @total_paid = (not @receipt.monto15.nil?) ? @total_paid + @receipt.monto15 : @total_paid
        @total_paid = (not @receipt.monto16.nil?) ? @total_paid + @receipt.monto16 : @total_paid
        @total_paid = (not @receipt.monto17.nil?) ? @total_paid + @receipt.monto17 : @total_paid
        @total_paid = (not @receipt.monto18.nil?) ? @total_paid + @receipt.monto18 : @total_paid
        @receipt.update_attribute 'total_paid', @total_paid  
      end
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
      @receipt.update_attribute 'area', 'Cobranza'
      # Solo para Flujo de Pago 1 (RP Completo)
      if @payment_flow==1 
        @receipt.update_attribute 'state', 'cerrado'
        redirect_to(@receipt, :notice => 'El Recibo de Pago se ha cerrado exitosamente y se encuentra listo para ser rendido.')           
      # Solo para Flujo de Pago 2 (RP por Completar)    
      elsif @payment_flow==2 
        redirect_to(@receipt, :notice => 'El Recibo de Pago se ha creado exitosamente y se encuentra listo para ser impreso.') 
      # Solo para Flujo de Pago 3 (RP con Gestion Terreno) 
      elsif @payment_flow==3
        @receipt.update_attribute 'state', 'solicita gestion terreno'
        redirect_to(@receipt, :notice => 'El Recibo de Pago se ha creado exitosamente y se encuentra listo para ser enviado a terreno.') 
      # existe un Error
      else
      end  
    end  
  end

  # GET /receipts/1/edit
  def edit
    @titulo = "Editar Recibo de Pago"
    @receipt = Receipt.find(params[:id])
    deny_access unless (@receipt.state!='cerrado') # No puede editarse un RP estado cerrado
    @tickets = Ticket.where("receipt_id=?", @receipt.id)
  end

  # PUT /receipts/1
  def update
    @receipt = Receipt.find(params[:id])
    @tickets = Ticket.where("receipt_id=?", @receipt.id)
    if @receipt.update_attributes(params[:receipt])
      if @receipt.state=='abierto' and @receipt.valid?
        @total_paid = 0
        @total_paid = (not @receipt.monto1.nil?) ? @total_paid + @receipt.monto1 : @total_paid
        @total_paid = (not @receipt.monto2.nil?) ? @total_paid + @receipt.monto2 : @total_paid
        @total_paid = (not @receipt.monto3.nil?) ? @total_paid + @receipt.monto3 : @total_paid
        @total_paid = (not @receipt.monto4.nil?) ? @total_paid + @receipt.monto4 : @total_paid
        @total_paid = (not @receipt.monto5.nil?) ? @total_paid + @receipt.monto5 : @total_paid
        @total_paid = (not @receipt.monto6.nil?) ? @total_paid + @receipt.monto6 : @total_paid
        @total_paid = (not @receipt.monto7.nil?) ? @total_paid + @receipt.monto7 : @total_paid
        @total_paid = (not @receipt.monto8.nil?) ? @total_paid + @receipt.monto8 : @total_paid
        @total_paid = (not @receipt.monto9.nil?) ? @total_paid + @receipt.monto9 : @total_paid
        @total_paid = (not @receipt.monto10.nil?) ? @total_paid + @receipt.monto10 : @total_paid
        @total_paid = (not @receipt.monto11.nil?) ? @total_paid + @receipt.monto11 : @total_paid
        @total_paid = (not @receipt.monto12.nil?) ? @total_paid + @receipt.monto12 : @total_paid
        @total_paid = (not @receipt.monto13.nil?) ? @total_paid + @receipt.monto13 : @total_paid
        @total_paid = (not @receipt.monto14.nil?) ? @total_paid + @receipt.monto14 : @total_paid
        @total_paid = (not @receipt.monto15.nil?) ? @total_paid + @receipt.monto15 : @total_paid
        @total_paid = (not @receipt.monto16.nil?) ? @total_paid + @receipt.monto16 : @total_paid
        @total_paid = (not @receipt.monto17.nil?) ? @total_paid + @receipt.monto17 : @total_paid
        @total_paid = (not @receipt.monto18.nil?) ? @total_paid + @receipt.monto18 : @total_paid
        @receipt.update_attribute 'total_paid', @total_paid  
        @receipt.update_attribute 'state', 'cerrado' 
        redirect_to(@receipt, :notice => 'El Recibo de Pago se ha cerrado exitosamente.') 
      else
        redirect_to(@receipt, :notice => 'El Recibo de Pago se ha actualizado exitosamente.') 
      end

    else
      render :action => "edit" 
    end
  end

  def rp_abtos
    deny_access unless (current_user.profile_id == 1)
    @titulo = "Recibos de Pago Abiertos"
    @receipts = Receipt.where("state='abierto'").where("user_name=?", current_user.name).where("group_id=?", current_user.group_id).where("area='Cobranza'")
  end

  def rp_rechz
    deny_access unless (current_user.profile_id == 1)
    @titulo = "Recibos de Pago Rechazados"
    @receipts1 = Receipt.where("state='rechazado'").where("area='Supervisor'").where("group_id=?", current_user.group_id)
    @receipts2 = Receipt.where("state='rechaza supervisor a cobranza' OR state='acepta cobranza rechazo supervisor'").where("group_id=?", current_user.group_id)
  end

  def rend_sup
    deny_access unless (current_user.profile_id == 1)
    @titulo = "Rendir Recibos de Pago a Supervisor"
    @receipts = Receipt.where("state='cerrado'").where("area='Cobranza'").where("group_id=?", current_user.group_id)
  end

  def print
    deny_access unless (current_user.profile_id == 1)
    @receipt = Receipt.find(params[:id])
    @tickets = Ticket.where("receipt_id=?", @receipt.id)
    @rconforme = false
    @tickets.each do |a|
      if a.doc_delivery
        @rconforme = true
      end
    end
    # @receipt.num_print.nil? ? @num_print=1 : @num_print=@receipt.num_print 
    @receipt.update_attribute 'print_user', current_user.name
    @receipt.update_attribute 'print_date', Time.now
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
