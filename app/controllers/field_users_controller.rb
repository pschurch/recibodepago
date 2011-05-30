class FieldUsersController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_adm

  def index
    @field_users = FieldUser.all
    @titulo = "Listado de Ejecutivos de Terreno"
  end

  def show
    @field_user = FieldUser.find(params[:id])
    @titulo = "Ver Ejecutivo de Terreno"
  end

  def new
    @field_user = FieldUser.new
    @titulo = "Crear Ejecutivo de Terreno"
  end

  def edit
    @field_user = FieldUser.find(params[:id])
    @titulo = "Editar Ejecutivo de Terreno"
  end

  def create
    @field_user = FieldUser.new(params[:field_user])
    @titulo = "Crear Ejecutivo de Terreno"
    if @field_user.save
      redirect_to(@field_user, :notice => 'El Ejecutivo de Terreno se ha creado exitosamente.') 
    else
      render :action => "new" 
    end
  end

  def update
    @field_user = FieldUser.find(params[:id])
    @titulo = "Editar Ejecutivo de Terreno"
    if @field_user.update_attributes(params[:field_user])
      redirect_to(@field_user, :notice => 'El Ejecutivo de Terreno se ha actualizado exitosamente.') 
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
