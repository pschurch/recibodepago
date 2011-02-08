class FinanceController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_tsr

  def ftlist
    @titulo = "Listado de Todos los Tickets"
    @tickets = Ticket.all
  end

  def frlist
    @titulo = "Listado de Todos los Recibos de Pago"
    @receipts = Receipt.all
  end

  def fhlist
  end

  def frmlist
  end

  private
    def perfil_name
      @perfil_name = "Tesoreria"
    end
end
