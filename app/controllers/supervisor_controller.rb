class SupervisorController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_sup
  helper_method :sort_column, :sort_direction  

  def stmod
    @titulo = "Tickets por Modificar"
    grupo = current_user.group_id
    @tickets = Ticket.where("state='pms'").where("group_id=?", grupo).order(sort_column + ' ' + sort_direction)  
  end

  def srlist
    @titulo = "Listado de Todos los Recibos de Pago"
    #@receipts = Receipt.where("group_id=?", current_user.group_id)
    params[:area].nil? ? @area = 'Todas' : @area = params[:area]
    params[:estado].nil? ? @estado = 'Todos' : @estado = params[:estado]
    if (@area=='Todas' and @estado=='Todos')
      @receipts = Receipt.where("group_id=?", current_user.group_id)
    elsif (@area=='Todas' and @estado!='Todos')
      @receipts = Receipt.where("state=?", @estado).where("group_id=?", current_user.group_id)
    elsif (@area!='Todas' and @estado=='Todos')
      @receipts = Receipt.where("area=?", @area).where("group_id=?", current_user.group_id)
    else
      @receipts = Receipt.where("area=?", @area).where("state=?", @estado).where("group_id=?", current_user.group_id)
    end
  end

  def stlist
    @titulo = "Listado de Tickets"
    @principals = Principal.where("state=true")
    (params[:mandante].nil? or params[:mandante]=='0') ? @mandante = 'Todos' : @mandante = params[:mandante]
    (params[:estado].nil? or params[:estado]=='t') ? @estado = 'Todos' : @estado = params[:estado]
    if (@mandante=='Todos' and @estado=='Todos')
      @tickets = Ticket.where("state!='para remesar' AND state!='remesado' AND state!='cerrado'").where("profile_create!='6'")#.where("group_id=?", current_user.group_id)
    elsif (@mandante=='Todos' and @estado!='Todos')       
      @tickets = Ticket.where("state=?", @estado).where("profile_create!='6'")#.where("group_id=?", current_user.group_id)
    elsif (@mandante!='Todos') and (@estado=='Todos')
      @tickets = Ticket.where("principal_id=?", @mandante.to_i).where("state!='para remesar' AND state!='remesado' AND state!='cerrado'").where("profile_create!='6'")#.where("group_id=?", current_user.group_id)
    elsif (@mandante!='Todos') and (@estado!='Todos')
      @tickets = Ticket.where("principal_id=?", @mandante.to_i).where("state=?", @estado).where("profile_create!='6'")#.where("group_id=?", current_user.group_id)
    end
  end

  def sanular
    @titulo = "Recibos de Pago para Anular"
    @receipts = Receipt.where("group_id=?", current_user.group_id).where("state='solicita anulacion'")
  end

  def sajustar
    @titulo = "Ajustar Recibos de Pago en Terreno"
    @receipts = Receipt.where("group_id=?", current_user.group_id).where("state='abierto'").where("area='Terreno'")
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

  def sr_rech_tesoreria
    @titulo = "Recibos de Pago Rechazador por Tesoreria"
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
