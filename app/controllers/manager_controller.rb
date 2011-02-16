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
    if (params[:f1]=='t' or params[:f1].nil? )
      @tickets = Ticket.all
    else
      @tickets = Ticket.where("state=?", params[:f1])
      case params[:f1] 
        when "pms"
          @estado ="por modificar supervisor"
        when "pmg"
          @estado ="por modificar gerencia"
        else
          @estado = params[:f1]
      end
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
