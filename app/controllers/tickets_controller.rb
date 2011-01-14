class TicketsController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_ejc

  def index
    @titulo = "Listado de Tickets"
    grupo = current_user.group_id
    @tickets = Ticket.where("state='creado' OR state='pms' OR state='pmg' OR state='modificado'").where("group_id=?", grupo).order(params[:sort])
  end

  def show
    @titulo = "Ver Ticket"
    @ticket = Ticket.find(params[:id])
  end

  def new
    @titulo = "Crear Ticket" 
    if params[:t].nil?
      @caso = nil
    else
      @caso = Assignment.find(params[:t])
    end
    @ticket = Ticket.new
    @user_id = current_user.id 
    @user_perfil = current_user.profile_id
    # new.html.erb
  end

  def create
    @titulo = "Crear Ticket" 
    @user_id = current_user.id 
    @user_perfil = current_user.profile_id
    @ticket = Ticket.new(params[:ticket])
    if @ticket.save
      @ticket.update_attribute 'group_id', current_user.group_id
      @ticket.update_attribute 'prepared_by', current_user.name
      redirect_to(@ticket, :notice => '1')
    else
      render :action => "new" 
    end
  end

  def edit
    @titulo = "Editar Ticket"
    @ticket = Ticket.find(params[:id])
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
      @resp = nil
    else
      @resp = Assignment.search(params[:search])
      if @resp.empty?
        @resp = nil
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
