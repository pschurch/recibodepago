class TicketsController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_tck

  def ntc  # vista para notificaciones
    @titulo = "Tickets"
    @ticket = Ticket.find(params[:id])
    @acc = params[:acc]
    case params[:acc] 
      when '2'  # crear el Ticket
        @msje = "se ha creado exitosamente"
      when '3'  # por modificar Supervisor
        @msje = "se encuentra en espera de ser modificado por el Supervisor"
      when '4'  # por modificar Gerencia
        @msje = "se encuentra en espera de ser modificado por Gerencia"
      when '5'  # modifica Supervisor/Gerencia
        @msje = "se ha modificado exitosamente"
      when '1'  # anular el Ticket
        @msje = "ha sido anulado"       
        @ticket.update_attribute 'state', "anulado"
        @ticket.update_attribute 'canceled_by', current_user.name
        @ticket.update_attribute 'canceled_time', Time.now
    end
  end

  def index
    @titulo = "Listado de Tickets"
    grupo = current_user.group_id
    @tickets = Ticket.where("state='creado' OR state='pms' OR state='pmg' OR state='modificado'").where("group_id=?", grupo).order(params[:sort])
  end

  def show
    @titulo = "Ver Ticket"
    @ticket = Ticket.find(params[:id])
  end

  def new
    deny_access unless (current_user.profile_id == 1 or current_user.profile_id == 2)
    @titulo = "Crear Ticket" 
    if params[:t].nil?
      @caso = nil
      session[:caso] = nil
    else
      if session[:caso].nil?
        session[:caso] = params[:t]
      end
      #--------------------------------------------------------
      @caso = Assignment.find(session[:caso])
      @pay_p = PaymentPolicy.where("principal_id =?", @caso.principal_id).where("product_id =?", @caso.product_id).where("collection_type_id =?", @caso.collection_type_id)
      @pay_p.each do |a|
        @fee = a.fee  
        @arr = a.arrear_interest
        @term = a.term_interest
      end
      @total = @caso.capital + @fee + @arr + @term 
      #---------------------------------------------------------
    end
    @ticket = Ticket.new
    # new.html.erb
  end

  def create
    @titulo = "Crear Ticket" 
    @ticket = Ticket.new(params[:ticket])
    if not session[:caso].nil?
      #--------------------------------------------------------
      @caso = Assignment.find(session[:caso])
      @pay_p = PaymentPolicy.where("principal_id =?", @caso.principal_id).where("product_id =?", @caso.product_id).where("collection_type_id =?", @caso.collection_type_id)
      @pay_p.each do |a|
        @fee = a.fee  
        @arr = a.arrear_interest
        @term = a.term_interest
      end
      @total = @caso.capital + @fee + @arr + @term 
      #---------------------------------------------------------
    end
    if @ticket.save
      @ticket.update_attribute 'group_id', current_user.group_id
      @ticket.update_attribute 'prepared_by', current_user.name
      if @ticket.adjust_sup?
        @ticket.update_attribute 'state', "pms"
        @ticket.update_attribute 'adjust_sup_time', Time.now
      end
      session[:caso] = nil
      redirect_to(:action => "ntc", :acc => '2', :id => @ticket.id ) 
    else
      render :action => "new" 
    end
  end

  def edit
    deny_access unless (current_user.profile_id == 1 or current_user.profile_id == 2 or current_user.profile_id == 6 or current_user.profile_id == 8)
    @titulo = "Editar Ticket"
    @ticket = Ticket.find(params[:id])
    @tid = params[:id]
  end

  def update
    @titulo = "Editar Ticket"
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(params[:ticket])
      #----- EjeCobr solicita modificacion de Supervisor ----
      if current_user.profile_id==1 and @ticket.adjust_sup?
        @ticket.update_attribute 'state', "pms"
        @ticket.update_attribute 'adjust_sup_time', Time.now
        redirect_to(:action => "ntc", :acc => '3', :id => @ticket.id ) #por modificar Supervisor  
      #----- Supervisor modifica ----
      elsif current_user.profile_id==2 and @ticket.state=='pms'
        if @ticket.adjust_mgt? 
          @ticket.update_attribute 'state', "pmg"
          @ticket.update_attribute 'adjust_mgt_time', Time.now
          redirect_to(:action => "ntc", :acc => '4', :id => @ticket.id ) #por modificar Gerencia   
        else
          @ticket.update_attribute 'state', "modificado"
          @ticket.update_attribute 'adjust_sup', false
          @ticket.update_attribute 'adjust_sup_des', ''
          @ticket.update_attribute 'adjust_sup_time', nil
          redirect_to(:action => "ntc", :acc => '5', :id => @ticket.id ) #modifica Supervisor   
        end
      elsif current_user.profile_id==2 and @ticket.state=='creado' and @ticket.adjust_mgt? 
          @ticket.update_attribute 'state', "pmg"
          @ticket.update_attribute 'adjust_mgt_time', Time.now
          redirect_to(:action => "ntc", :acc => '4', :id => @ticket.id ) #por modificar Gerencia   
      #----- Gerencia modifica ----
      elsif current_user.profile_id==6 and @ticket.state=='pmg'
        @ticket.update_attribute 'state', "modificado"
        @ticket.update_attribute 'adjust_sup', false
        @ticket.update_attribute 'adjust_sup_des', ''
        @ticket.update_attribute 'adjust_sup_time', nil
        @ticket.update_attribute 'adjust_mgt', false
        @ticket.update_attribute 'adjust_mgt_des', ''
        @ticket.update_attribute 'adjust_mgt_time', nil
        redirect_to(:action => "ntc", :acc => '5', :id => @ticket.id ) #modifica Gerencia   
      else
        redirect_to(@ticket, :notice => 'El Ticket se ha actualizado exitosamente.') 
      end
    else
      render :action => "edit" 
    end
 end

  def destroy
  end

  def search
    deny_access unless (current_user.profile_id == 1)
    @titulo = "Busqueda de RUT"
  end

  def cases
    deny_access unless (current_user.profile_id == 1)
    session[:caso] = nil
    @titulo = "Listado de Casos"  
    if params[:search] == ""
      @resp = nil
    else
      @resp = Assignment.search(params[:search])
      if @resp.empty?
        @resp = nil
      end
    end
  end

  private
    def perfil_name
      if current_user.profile_id==1 
        @perfil_name = "Ejecutivo de Cobranza"
      elsif current_user.profile_id==2
        @perfil_name = "Supervisor"
      elsif current_user.profile_id==4
        @perfil_name = "Tesoreria"
      elsif current_user.profile_id==6
        @perfil_name = "Gerencia"
      elsif current_user.profile_id==8
        @perfil_name = "Designer"
      end 
    end

end
