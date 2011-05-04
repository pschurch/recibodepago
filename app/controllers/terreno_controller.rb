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

  private
    def perfil_name
      @perfil_name = "Jefe Terreno"
    end
end
