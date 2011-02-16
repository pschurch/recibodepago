class FinanceController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_tsr

  def ftlist
    @titulo = "Listado de Todos los Tickets"
    if (params[:filtro]=='t' or params[:filtro].nil? )
      @tickets = Ticket.all
    else
      @tickets = Ticket.where("state=?", params[:filtro])
      case params[:filtro] 
        when "pms"
          @estado ="por modificar supervisor"
        when "pmg"
          @estado ="por modificar gerencia"
        else
          @estado = params[:filtro]
      end
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
