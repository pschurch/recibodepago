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
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to(@ticket, :notice => 'Ticket was successfully created.') }
        format.xml  { render :xml => @ticket, :status => :created, :location => @ticket }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @ticket = Ticket.find(params[:id])
    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to(@ticket, :notice => 'Ticket was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
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
