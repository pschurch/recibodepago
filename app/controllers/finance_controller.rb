class FinanceController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_tsr

  def ftlist
    @titulo = "Listado de Todos los Tickets"
    (params[:estado].nil? or params[:estado]=='t') ? @estado = 'Todos' : @estado = params[:estado]
    if (@estado=='Todos')
      @tickets = Ticket.all
    else
      @tickets = Ticket.where("state=?", @estado)
    end
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
