class TicketsController < ApplicationController
  before_filter :perfil_name

  def index
    @titulo = "Listado de Tickets"
    @tickets = Ticket.order(params[:sort])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tickets }
    end
  end

  def show
    @titulo = "Ver Ticket"
    @ticket = Ticket.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  def new
    @user_id = current_user.id 
    @user_perfil = current_user.profile_id
    @titulo = "Crear Ticket"
    @ticket = Ticket.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  def edit
    @titulo = "Editar Ticket"
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
  end

  def list
    @titulo = "Listado de Casos"
    @resp = Assignment.search(params[:search])
  end

  private
    def perfil_name
      @perfil_name = "Ejecutivo de Cobranza"
    end
end
