class ManagerController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_ger

  def mtmod
    @titulo = "Tickets por Modificar"
    @tickets = Ticket.where("state='pmg'")
  end

  def mtlist
    @titulo = "Listado de Todos los Tickets"
    @tickets = Ticket.all
  end

  def mrlist
    @titulo = "Listado de Todos los Recibos de Pago"
    @receipts = Receipt.all
  end

  private
    def perfil_name
      @perfil_name = "Gerencia"
    end
end
