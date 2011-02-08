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
    @tickets = Ticket.all
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
