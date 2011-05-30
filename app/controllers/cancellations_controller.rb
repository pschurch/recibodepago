class CancellationsController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_adm 

  def index
    @cancellations = Cancellation.all
    @titulo = "Listado de Tipos de Anulaciones"
  end

  def show
    @cancellation = Cancellation.find(params[:id])
    @titulo = "Ver Tipo de Anulacion"
  end

  def new
    @cancellation = Cancellation.new
    @titulo = "Crear Tipo de Anulacion"
  end

  def edit
    @cancellation = Cancellation.find(params[:id])
    @titulo = "Editar Tipo de Anulacion"
  end

  def create
    @cancellation = Cancellation.new(params[:cancellation])
    @titulo = "Crear Tipo de Anulacion"
    if @cancellation.save
      redirect_to(@cancellation, :notice => 'El Tipo de Anulacion se ha creado exitosamente.') 
    else
      render :action => "new" 
    end
  end

  def update
    @cancellation = Cancellation.find(params[:id])
    @titulo = "Editar Tipo de Anulacion"
    if @cancellation.update_attributes(params[:cancellation])
      redirect_to(@cancellation, :notice => 'El Tipo de Anulacion se ha actualizado exitosamente.') 
    else
      render :action => "edit" 
    end
  end

  def destroy
  end

  private
    def perfil_name
      if current_user.profile_id==7 
        @perfil_name = "Administrador"
      elsif current_user.profile_id==8
        @perfil_name = "Designer"
      end
    end
end
