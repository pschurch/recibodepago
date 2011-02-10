class DesignerController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_dsg

  def destr
    @titulo = "Notificacion"
    @id = params[:id]
    if params[:co] 
      @ticket = Ticket.find(params[:id])
      @ticket.destroy
      redirect_to(:action => 'tdsg')
    end
  end

  def cdsg
    @titulo = "Listado de Todos los Casos"
    @assignments = Assignment.all  
end

  def tdsg
    @titulo = "Listado de Todos los Tickets"
    @tickets = Ticket.order(params[:sort])
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
