class SupervisorController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_sup
  helper_method :sort_column, :sort_direction  

  def sr_recp_cobr
    @titulo = "Recepcionar Recibos de Pago de Cobranza"
    @receipts1 = Receipt.where("group_id=?", current_user.group_id).where("state='rendido'").where("area='Cobranza'")
    @receipts2 = Receipt.where("group_id=?", current_user.group_id).where("state='recepcionado'").where("area='Supervisor'")
  end
  def sr_recp_cobr_edit  
    @titulo = "Rendicion de Recibos de Pago"
  end
  def sr_recp_cobr_update  
    @receipts = Receipt.find(params[:receipt_ids]) 
    @receipts.each do |r|
      r.update_attribute 'state', 'rendido'  
      #actualizar los otros estados xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  
    end  
    redirect_to(:action => 'sr_recp_cobr') 
  end



  def stmod
    @titulo = "Tickets por Modificar"
    grupo = current_user.group_id
    @tickets = Ticket.where("state='pms'").where("group_id=?", grupo).order(sort_column + ' ' + sort_direction)  
  end

  def stlist
    @titulo = "Listado de Tickets"
    @principals = Principal.where("state=true")
    (params[:mandante].nil? or params[:mandante]=='0') ? @mandante = 'Todos' : @mandante = params[:mandante]
    (params[:estado].nil? or params[:estado]=='t') ? @estado = 'Todos' : @estado = params[:estado]
    if (@mandante=='Todos' and @estado=='Todos')
      @tickets = Ticket.where("state='creado' OR state='anulado' OR state='pms' OR state='pmg' OR state='modificado' OR state='rc'").where("group_id=?", current_user.group_id)
    elsif (@mandante=='Todos' and @estado!='Todos')       
      @tickets = Ticket.where("state=?", @estado).where("group_id=?", current_user.group_id)
    elsif (@mandante!='Todos') and (@estado=='Todos')
      @tickets = Ticket.where("principal_id=?", @mandante.to_i).where("state='creado' OR state='anulado' OR state='pms' OR state='pmg' OR state='modificado' OR state='rc'").where("group_id=?", current_user.group_id)
    elsif (@mandante!='Todos') and (@estado!='Todos')
      @tickets = Ticket.where("principal_id=?", @mandante.to_i).where("state=?", @estado).where("group_id=?", current_user.group_id)
    end
  end

  def sr_envio_terreno
    @titulo = "Enviar Recibos de Pago a Terreno"
    @receipts = Receipt.where("group_id=?", current_user.group_id).where("state='solicita gestion terreno'")
  end

  def sr_recp_terreno
    @titulo = "Recepcionar Recibos de Pago de Terreno"
    @receipts = Receipt.where("group_id=?", current_user.group_id)
  end
  def sr_rech_terreno
    @titulo = "Recibos de Pago Rechazador por Terreno"
    @receipts = Receipt.where("group_id=?", current_user.group_id)
  end
  def sr_rend_tesoreria
    @titulo = "Rendir Recibos de Pago a Tesoreria"
    @receipts = Receipt.where("group_id=?", current_user.group_id)
  end
  def sr_rech_tesoreria
    @titulo = "Recibos de Pago Rechazador por Tesoreria"
    @receipts = Receipt.where("group_id=?", current_user.group_id)
  end

  def srlist
    @titulo = "Listado de Todos los Recibos de Pago"
    @receipts = Receipt.where("group_id=?", current_user.group_id)
  end

  def sort_column  
    params[:sort] || "id"  
  end  
  def sort_direction  
    params[:direction] || "asc"  
  end  

  private
    def perfil_name
      @perfil_name = "Supervisor"
    end
end
