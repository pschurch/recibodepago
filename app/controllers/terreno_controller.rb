class TerrenoController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_jtr
  helper_method :sort_column, :sort_direction  

  def trlist
    @titulo = "Listado de Recibos de Pago"
    @receipts = Receipt.all
    params[:area].nil? ? @area = 'Todas' : @area = params[:area]
    params[:estado].nil? ? @estado = 'Todos' : @estado = params[:estado]
    if (@area=='Todas' and @estado=='Todos')
      @receipts = Receipt.all
    elsif (@area=='Todas' and @estado!='Todos')
      @receipts = Receipt.where("state=?", @estado)
    elsif (@area!='Todas' and @estado=='Todos')
      @receipts = Receipt.where("area=?", @area)
    else
      @receipts = Receipt.where("area=?", @area).where("state=?", @estado)
    end
  end

  def trrecp
    @titulo = "Recibos de Pago para gestionar en Terreno"
    @groups   = Group.all
    params[:grupo].nil? ? @grupo = 0 : @grupo = params[:grupo]
    if (@grupo==0 or @grupo=='0')
      @receipts = Receipt.where("state=?", 'solicita gestion terreno')
    else 
      @receipts = Receipt.where("group_id=?", @grupo).where("state=?", 'solicita gestion terreno')
    end
  end

  def trcerr
    @titulo = "Cerrar Recibos de Pago"
    @receipts = Receipt.where("state='abierto'").where("area='Terreno'").order(params[:sort])
  end

  def sort_column  
    params[:sort] || "id"  
  end  
  def sort_direction  
    params[:direction] || "asc"  
  end  

  private
    def perfil_name
      @perfil_name = "Jefe Terreno"
    end
end
