class ProfilesController < ApplicationController
  before_filter :perfil_name

  def index
    @profiles = Profile.all
    @titulo = "Listado de Perfiles"
  end

  def show
    @profile = Profile.find(params[:id])
    @titulo = "Ver Perfil"
  end

  def new
    @profile = Profile.new
    @titulo = "Crear Perfil"
  end

  def edit
    @profile = Profile.find(params[:id])
    @titulo = "Editar Perfil"
  end

  def create
    @profile = Profile.new(params[:profile])
    if @profile.save
      redirect_to(@profile, :notice => 'El Perfil se ha creado exitosamente.') 
    else
      render :action => "new" 
    end
  end

  def update
    @profile = Profile.find(params[:id])
    @titulo = "Editar Perfil"
    if @profile.update_attributes(params[:profile])
      redirect_to(@profile, :notice => 'El Perfil se ha actualizado exitosamente.') 
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

