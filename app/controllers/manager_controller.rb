class ManagerController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_ger
  helper_method :sort_column, :sort_direction  

  def mtmod
    @titulo = "Tickets por Modificar"
    @tickets = Ticket.where("state='pmg'").order(sort_column + ' ' + sort_direction)  
  end

  def mtlist
    @titulo = "Listado de Todos los Tickets"
    (params[:estado].nil? or params[:estado]=='t') ? @estado = 'Todos' : @estado = params[:estado]
    if (@estado=='Todos')
      @tickets = Ticket.all
    else
      @tickets = Ticket.where("state=?", @estado)
    end
  end

  def mrlist
    @titulo = "Listado de Todos los Recibos de Pago"
    @receipts = Receipt.all
  end

  def sort_column  
    params[:sort] || "id"  
  end  
  def sort_direction  
    params[:direction] || "asc"  
  end  

  private
    def perfil_name
      @perfil_name = "Gerencia"
    end
end
