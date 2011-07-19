class TicketsController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_tck
  helper_method :sort_column, :sort_direction  

  def ntc  # vista para notificaciones
    @titulo = "Tickets"
    if params[:id].nil?
      @ticket_id = nil
    else
      @ticket = Ticket.find(params[:id])
      @ticket_id = @ticket.id
    end
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
      when '6'  # no existe politica de pago
        @msje = "no puede ser creado pues no exite la politica de pago para los parametros seleccionados. Contactar al Administrador"
      when '7'  # no pertenece a su grupo
        @msje = "no puede ser creado pues el Mandante-Producto que usted ha seleccionado no pertenece a su Grupo"
      when '1'  # anular el Ticket
        @msje = "ha sido anulado"       
        @ticket.update_attribute 'state', "anulado"
        @ticket.update_attribute 'canceled_by', current_user.name
        @ticket.update_attribute 'canceled_time', Time.now
        @caso = Assignment.where("ticket_id =?", @ticket.id)
        @caso.each do |c|
          c.update_attribute 'state', "cargado"
          c.update_attribute 'ticket_id', nil
        end
    end
  end

  def index
    @titulo = "Listado de Tickets"
    grupo = current_user.group_id
    @tickets = Ticket.where("state='creado' OR state='pms' OR state='pmg' OR state='modificado'").where("group_id=?", grupo).order(sort_column + ' ' + sort_direction)
  end

  def show
    @titulo = "Ver Ticket"
    @ticket = Ticket.find(params[:id])
  end

  def new
    #deny_access unless (current_user.profile_id == 1 or current_user.profile_id == 2)
    @titulo = "Crear Ticket" 
    session[:ticket_step] = nil
    if params[:t].nil?
      @caso = nil
      session[:caso] = nil
    else
      if session[:caso].nil?
        session[:caso] = params[:t]
      end
      # ---------  Parametros -------------------
      if current_user.profile_id == 1 # perfil Ej Cobranza
        @parm1 = Parameter.where("id=1") 
        @parm1.each do |p|
          @ajuste_mx = p.val_int  
        end
      elsif current_user.profile_id == 2 # perfil Supervisor
        @parm1 = Parameter.where("id=2") 
        @parm1.each do |p|
          @ajuste_mx = p.val_int  
        end
      end
      @parm1 = Parameter.where("id=3").select("val_dec") 
      @parm1.each do |p|
        @int_mora = p.val_dec  
      end
      @parm1 = Parameter.where("id=4").select("val_dec") 
      @parm1.each do |p|
        @int_plazo = p.val_dec  
      end
      # ----------- Fin de Parametros -------------------
      @caso = Assignment.find(session[:caso])
      @pay_p = PaymentPolicy.where("principal_id =?", @caso.principal_id).where("product_id =?", @caso.product_id).where("collection_type_id =?", @caso.collection_type_id)
      @pay_p.each do |a|
        @fee = a.fee  
        #@arr = a.arrear_interest
        #@term = a.term_interest
      end
      #@total = @caso.capital + @fee + @arr + @term 
      #---------------------------------------------------------
    end
    @ticket = Ticket.new
  end

  def create
    @titulo = "Crear Ticket" 
    @ticket = Ticket.new(params[:ticket])
    @ticket.current_step = session[:ticket_step]
    # ---------  Parametros -------------------
      if current_user.profile_id == 1 # perfil Ej Cobranza
        @parm1 = Parameter.where("id=1") 
        @parm1.each do |p|
          @ajuste_mx = p.val_int  
        end
      elsif current_user.profile_id == 2 # perfil Supervisor
        @parm1 = Parameter.where("id=2") 
        @parm1.each do |p|
          @ajuste_mx = p.val_int  
        end
      elsif current_user.profile_id == 3 # perfil Terreno
        @parm1 = Parameter.where("id=5") 
        @parm1.each do |p|
          @ajuste_mx = p.val_int  
        end
      end
      @parm1 = Parameter.where("id=3").select("val_dec") 
      @parm1.each do |p|
        @int_mora = p.val_dec  
      end
      @parm1 = Parameter.where("id=4").select("val_dec") 
      @parm1.each do |p|
        @int_plazo = p.val_dec  
      end
    # ----------- Fin de Parametros -------------------
    if session[:caso].nil?
      if (current_user.profile_id==1)
        for a in Cartera.where("principal_id=?", @ticket.principal_id).where("product_id =?", @ticket.product_id)
          @cartera_id = a.id
        end
        if not(@cartera_id.nil?)
          @cargrup = Cargrup.where("group_id=?", current_user.group_id).where("cartera_id=?",@cartera_id) 
        end
      end
      @pay_p = PaymentPolicy.where("principal_id =?", @ticket.principal_id).where("product_id =?", @ticket.product_id).where("collection_type_id =?", @ticket.collection_type_id)
      for a in Principal.where("id =?", @ticket.principal_id) 
        @principal = a.name
      end 
      for a in Product.where("id =?", @ticket.product_id) 
        @product = a.name
      end 
      for a in CollectionType.where("id =?", @ticket.collection_type_id) 
        @collection = a.name
      end 
    else
      @caso = Assignment.find(session[:caso])
      @pay_p = PaymentPolicy.where("principal_id =?", @caso.principal_id).where("product_id =?", @caso.product_id).where("collection_type_id =?", @caso.collection_type_id)
    end
    #-----------------------------------------------------------------
    if (session[:caso].nil? and @cartera_id.nil? and (current_user.profile_id==1))
        redirect_to(:action => "ntc", :acc => '7' ) # no pertenece al grupo
    elsif (session[:caso].nil? and (@cargrup.nil? or @cargrup.empty?) and (current_user.profile_id==1))
        redirect_to(:action => "ntc", :acc => '7' ) # no pertenece al grupo
    elsif (@pay_p.nil? or @pay_p.empty?)
      redirect_to(:action => "ntc", :acc => '6' ) # no existe politica de pago  
    else
      @pay_p.each do |a|
        @fee = a.fee  
        #@arr = a.arrear_interest
        #@term = a.term_interest
      end
      if @ticket.valid?
        if params[:rec_button]  
          @ticket.save #if @ticket.all_valid? 
          @ticket.update_attribute 'group_id', current_user.group_id
          @ticket.update_attribute 'user_id', current_user.id
          @ticket.update_attribute 'profile_create', current_user.profile_id
          @total_pay =  @ticket.capital + @ticket.fee + @ticket.arrear_interest + @ticket.term_interest + @ticket.shipping_costs + @ticket.legal_costs
          @adjust_val = @ticket.ad_capital + @ticket.ad_fee + @ticket.ad_arrear_interest + @ticket.ad_term_interest + @ticket.ad_shipping_costs + @ticket.ad_legal_costs
          @ticket.update_attribute 'total_pay', @total_pay
          @ticket.update_attribute 'adjust_val', @adjust_val
          if (current_user.profile_id==1 or current_user.profile_id==3) # perfil Ej Cobranza/Terreno
            if (@ticket.state=='creado')
              if (@ticket.adjust_sup?)
                @ticket.update_attribute 'state', "pms"
                @ticket.update_attribute 'adjust_sup_time', Time.now
                #@ticket.update_attribute 'adjust_val', "0"
                @ticket.update_attribute 'adjust_obs', ""
              end
            end
          elsif current_user.profile_id == 2 # perfil Supervisor
            if (@ticket.adjust_mgt?)
              @ticket.update_attribute 'state', "pmg"
              @ticket.update_attribute 'adjust_mgt_time', Time.now
              #@ticket.update_attribute 'adjust_val', "0"
              @ticket.update_attribute 'adjust_obs', ""
            end
          end
          if @adjust_val!=0
            @ticket.update_attribute 'new_total_pay', @total_pay + @adjust_val
            @ticket.update_attribute 'adjust_time', Time.now
            @ticket.update_attribute 'adjust_by', current_user.name
          end
          if not session[:caso].nil?
            @ticket.update_attribute 'assignment_id', @caso.id 
            @caso.update_attribute 'state', "ticket_creado"
            @caso.update_attribute 'ticket_id', @ticket.id
            session[:caso] = nil
          end
        elsif params[:next_button]   
          @ticket.next_step
        end  
        session[:ticket_step] = @ticket.current_step
      end
      if @ticket.new_record?  
        render :action => "new"  
      else 
        session[:order_step] = nil
        redirect_to(@ticket, :notice => '1')
      end  
    end
  end

  def edit
    #deny_access unless (current_user.profile_id == 1 or current_user.profile_id == 2 or current_user.profile_id == 6 or current_user.profile_id == 8)
    @titulo = "Editar Ticket"
    @ticket = Ticket.find(params[:id])
    # ---------  Ajustes -------------------
      if current_user.profile_id == 1 # perfil Ej Cobranza
        @parm1 = Parameter.where("id=1") 
        @parm1.each do |p|
          @ajuste_mx = p.val_int  
        end
      elsif current_user.profile_id == 2 # perfil Supervisor
        @parm1 = Parameter.where("id=2") 
        @parm1.each do |p|
          @ajuste_mx = p.val_int  
        end
      end
      @ticket.update_attribute 'adjust_mx', @ajuste_mx
      @ticket.update_attribute 'profile', current_user.profile_id
    # ----------- Fin de Ajustes -------------------
    @tid = params[:id]
  end

  def update
    @titulo = "Editar Ticket"
    @ticket = Ticket.find(params[:id])
    if current_user.profile_id == 1 # perfil Ej Cobranza
      @parm1 = Parameter.where("id=1") 
      @parm1.each do |p|
        @ajuste_mx = p.val_int  
      end
    elsif current_user.profile_id == 2 # perfil Supervisor
      @parm1 = Parameter.where("id=2") 
      @parm1.each do |p|
        @ajuste_mx = p.val_int  
      end
    end
    if @ticket.update_attributes(params[:ticket])
      @total_pay =  @ticket.capital + @ticket.fee + @ticket.arrear_interest + @ticket.term_interest + @ticket.shipping_costs + @ticket.legal_costs
      @ticket.update_attribute 'total_pay', @total_pay
      @adjust_val = @ticket.ad_capital + @ticket.ad_fee + @ticket.ad_arrear_interest + @ticket.ad_term_interest + @ticket.ad_shipping_costs + @ticket.ad_legal_costs
      @ticket.update_attribute 'adjust_val', @adjust_val
      #----------- Ajustes ------------------------
      if current_user.profile_id == 1 # perfil Ej Cobranza
        if (@ticket.adjust_val!=0 )
            @ticket.update_attribute 'new_total_pay', @total_pay + @ticket.adjust_val
            @ticket.update_attribute 'adjust_time', Time.now
            @ticket.update_attribute 'adjust_by', current_user.name
        end
      elsif current_user.profile_id == 2 # perfil Supervisor
        if (@ticket.adjust_val!=0 )
            @ticket.update_attribute 'new_total_pay', @total_pay + @ticket.adjust_val
            @ticket.update_attribute 'adjust_time', Time.now
            @ticket.update_attribute 'adjust_by', current_user.name
            # -------- Ajuste en terreno:
            if (@ticket.state=='recibo creado')
              @rp_id = @ticket.receipt_id
              @receipt = Receipt.where("id=?", @rp_id)
              @tickets_all = Ticket.where("receipt_id=?", @rp_id)
              @total_rp = 0
              @tickets_all.each do |a|
                if a.new_total_pay.nil?
                  @total_rp = @total_rp + a.total_pay
                else
                  @total_rp = @total_rp + a.new_total_pay
                end
              end
              @receipt.each do |r|
                r.update_attribute 'total_pay', @total_rp
              end
            end 
        end
      elsif current_user.profile_id == 6 # perfil Gerencia
        if (@ticket.adjust_val!=0 )
            @ticket.update_attribute 'new_total_pay', @total_pay + @ticket.adjust_val
            @ticket.update_attribute 'adjust_time', Time.now
            @ticket.update_attribute 'adjust_by', current_user.name
        end
      end
      #----------- Fin Ajustes ------------------------

      # Acciones posibles a realizar: 
      #----- EjeCobr/Terr solicita modificacion de Supervisor ----
      if (current_user.profile_id==1 or current_user.profile_id==3) and @ticket.adjust_sup?
        @ticket.update_attribute 'state', "pms"
        @ticket.update_attribute 'adjust_sup_time', Time.now
        @ticket.update_attribute 'adjust_val', "0"
        @ticket.update_attribute 'adjust_obs', ""
        redirect_to(:action => "ntc", :acc => '3', :id => @ticket.id ) #por modificar Supervisor  
      #----- Supervisor modifica ----
      elsif current_user.profile_id==2 and (@ticket.state=='pms' or @ticket.state=='creado')
        if @ticket.adjust_mgt? 
          @ticket.update_attribute 'state', "pmg"
          @ticket.update_attribute 'adjust_mgt_time', Time.now
          @ticket.update_attribute 'adjust_val', "0"
          @ticket.update_attribute 'adjust_obs', ""
          redirect_to(:action => "ntc", :acc => '4', :id => @ticket.id ) #por modificar Gerencia   
        else
          @ticket.update_attribute 'state', "modificado"
          @ticket.update_attribute 'adjust_sup', false
          redirect_to(:action => "ntc", :acc => '5', :id => @ticket.id ) #modifica Supervisor   
        end
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
        @perfil_name = "Jefe Terreno"
      elsif current_user.profile_id==4
        @perfil_name = "Tesoreria"
      elsif current_user.profile_id==6
        @perfil_name = "Gerencia"
      elsif current_user.profile_id==8
        @perfil_name = "Designer"
      end 
    end

end
