class ParametersController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_adm 

  def index
    @parameters = Parameter.all
    @titulo = "Listado de Parametros"
  end

  def show
    @parameter = Parameter.find(params[:id])
    @titulo = "Ver Parametro"
  end

  def new
    @parameter = Parameter.new
    @titulo = "Crear Parametro"
  end

  def edit
    @parameter = Parameter.find(params[:id])
    @titulo = "Editar Parametro"
  end

  def create
    @parameter = Parameter.new(params[:parameter])
    @titulo = "Crear Parametro"
    if @parameter.save
      redirect_to(@parameter, :notice => 'El Parametro se ha creado exitosamente.') 
    else
      render :action => "new" 
    end
  end

  def update
    @parameter = Parameter.find(params[:id])
    @titulo = "Editar Parametro"
    if @parameter.update_attributes(params[:parameter])
      redirect_to(@parameter, :notice => 'El Parametro se ha actualizado exitosamente.') 
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
