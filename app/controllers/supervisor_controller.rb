class SupervisorController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_sup

  def stmod
    @titulo = "Tickets por Modificar"
    grupo = current_user.group_id
    @tickets = Ticket.where("state='pms'").where("group_id=?", grupo)
  end

  def stlist
    @titulo = "Listado de Tickets"
    @principals = Principal.all
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

  def srlist
    @titulo = "Listado de Todos los Recibos de Pago"
    @receipts = Receipt.all
  end

  private
    def perfil_name
      @perfil_name = "Supervisor"
    end
end
