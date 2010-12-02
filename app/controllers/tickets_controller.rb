class TicketsController < ApplicationController
  def index
    @titulo = "Listado de Tickets"
    @perfil_name = "Ejecutivo de Cobranza"
    @tickets = Ticket.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tickets }
    end
  end

  def show
    @titulo = "Ver Ticket"
    @perfil_name = "Ejecutivo de Cobranza"
    @ticket = Ticket.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  def new
    @titulo = "Crear Ticket"
    @perfil_name = "Ejecutivo de Cobranza"
    @ticket = Ticket.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  def edit
    @titulo = "Editar Ticket"
    @perfil_name = "Ejecutivo de Cobranza"
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    if @ticket.save
      redirect_to(@ticket, :notice => '1')
    else
      render :action => "new" 
    end
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(params[:ticket])
      redirect_to(@ticket, :notice => 'El Ticket se ha actualizado exitosamente.') 
    else
      render :action => "edit" 
    end
  end

  def destroy
  end

  def search
    @titulo = "Busqueda de RUT"
    @perfil_name = "Ejecutivo de Cobranza"
  end

  def list
    @titulo = "Listado de Casos"
    @perfil_name = "Ejecutivo de Cobranza"
    @resp = Assignment.search(params[:search])
  end

end
