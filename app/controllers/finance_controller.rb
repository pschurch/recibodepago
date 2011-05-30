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

  def fhlist
    @titulo = "Listado de Honorarios TM por facturar"
  end

  def frmmp
    @titulo = "Remesar"
    @principals = Principal.where("state=true")
    @products = Product.where("state=true")
  end
  def frmnew
    @titulo = "Remesar"
    @principal = params[:principal]
    @product = params[:product]
    @principals = Principal.where("id=?", @principal)
    @products = Product.where("id=?", @product)

    @principal_name = @principals.first.name
    @product_name = @products.first.name

    @receipts = Receipt.where("state='cerrado'").where("area='Tesoreria'").where("principal_id=?", @principal).where("product_id=?", @product)
  end

  def frmlist
    @titulo = "Listado de Remesas"
  end

  private
    def perfil_name
      @perfil_name = "Tesoreria"
    end
end
