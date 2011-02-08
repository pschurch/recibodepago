class DesignerController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_dsg

  def cdsg
    @titulo = "Listado de Todos los Casos"
    @assignments = Assignment.all  
end

  def tdsg
    @titulo = "Listado de Todos los Tickets"
    @tickets = Ticket.all
  end

  def rdsg
    @titulo = "Listado de Todos los Recibos de Pago"
    @receipts = Receipt.all
  end

  private
    def perfil_name
      @perfil_name = "Designer"
    end

end
