class TicketsController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_ejc

  def index
    @titulo = "Listado de Tickets"
    @tickets = Ticket.order(params[:sort])
  end

  def show
    @titulo = "Ver Ticket"
    @ticket = Ticket.find(params[:id])
  end

  def new
    if params[:f].nil?
      @case = nil
    else
      @case = Assignment.find(params[:f])
    end
    @user_id = current_user.id 
    @user_perfil = current_user.profile_id
    @titulo = "Crear Ticket"
    @ticket = Ticket.new
  end

  def edit
    @titulo = "Editar Ticket"
    @ticket = Ticket.find(params[:id])
  end

  def create
    @user_id = current_user.id 
    @user_perfil = current_user.profile_id
    @titulo = "Crear Ticket"
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

  def cases
    @titulo = "Listado de Casos"  
    if params[:search] == ""
      @case = nil
    else
      @case = Assignment.search(params[:search])
      if @case.empty?
        @case = nil
      end
    end
  end

  def create_rp
    @titulo = "Crear Recibo de Pago"
    @tickets = Ticket.order(params[:sort])
  end

  private
    def perfil_name
     if current_user.profile_id==1 
        @perfil_name = "Ejecutivo de Cobranza"
      elsif current_user.profile_id==8
        @perfil_name = "Designer"
      end 
    end
end
