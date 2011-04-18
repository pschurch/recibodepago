class SupervisorController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_sup
  helper_method :sort_column, :sort_direction  

  def stmod
    @titulo = "Tickets por Modificar"
    grupo = current_user.group_id
    @tickets = Ticket.where("state='pms'").where("group_id=?", grupo).order(sort_column + ' ' + sort_direction)  
  end

  def stlist
    @titulo = "Listado de Tickets"
    @principals = Principal.where("state=true")
    if (params[:f1].nil? or params[:f1]=='0') and (params[:f2].nil? or params[:f2]=='t')
      @tickets = Ticket.where("state='creado' OR state='anulado' OR state='pms' OR state='pmg' OR state='modificado' OR state='rc'").where("group_id=?", current_user.group_id)
    elsif (params[:f1]=='0') and (not params[:f2]=='t')       
      @tickets = Ticket.where("state=?", params[:f2]).where("group_id=?", current_user.group_id)
    elsif (not params[:f1]=='0') and (params[:f2]=='t')
      @tickets = Ticket.where("principal_id=?", params[:f1].to_i).where("state='creado' OR state='anulado' OR state='pms' OR state='pmg' OR state='modificado' OR state='rc'").where("group_id=?", current_user.group_id)
    elsif (not params[:f1]=='0') and (not params[:f2]=='t')
      @tickets = Ticket.where("principal_id=?", params[:f1].to_i).where("state=?", params[:f2]).where("group_id=?", current_user.group_id)
    end
  end

  def sr_recp_cobr
    @titulo = "Recepcionar Recibos de Pago de Cobranza"
    @receipts1 = Receipt.where("group_id=?", current_user.group_id).where("state='rendido'").where("area='Cobranza'")
    @receipts2 = Receipt.where("group_id=?", current_user.group_id).where("state='recepcionado'").where("area='Supervisor'")
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
