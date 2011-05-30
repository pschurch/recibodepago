class RejectionTypesController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_adm 

  def index
    @rejection_types = RejectionType.all
    @titulo = "Listado de Tipos de Rechazo"
  end

  def show
    @rejection_type = RejectionType.find(params[:id])
    @titulo = "Ver Tipo de Rechazo"
  end

  def new
    @rejection_type = RejectionType.new
    @titulo = "Crear Tipo de Rechazo"
  end

  def edit
    @rejection_type = RejectionType.find(params[:id])
    @titulo = "Editar Tipo de Rechazo"
  end

  def create
    @rejection_type = RejectionType.new(params[:rejection_type])
    @titulo = "Crear Tipo de Rechazo"
    if @rejection_type.save
      redirect_to(@rejection_type, :notice => 'El Tipo de Rechazo se ha creado exitosamente.') 
    else
      render :action => "new" 
    end
  end

  def update
    @rejection_type = RejectionType.find(params[:id])
    @titulo = "Editar Tipo de Rechazo"
    if @rejection_type.update_attributes(params[:rejection_type])
      redirect_to(@rejection_type, :notice => 'El Tipo de Rechazo se ha actualizado exitosamente.') 
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
