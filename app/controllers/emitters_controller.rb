class EmittersController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_adm 

  def index
    @emitters = Emitter.all
    @titulo = "Listado de Emisores"
  end

  def show
    @emitter = Emitter.find(params[:id])
    @titulo = "Ver Emisor"
  end

  def new
    @emitter = Emitter.new
    @titulo = "Crear Emisor"
  end

  def edit
    @emitter = Emitter.find(params[:id])
    @titulo = "Editar Emisor"
  end

  def create
    @emitter = Emitter.new(params[:emitter])
    if @emitter.save
      redirect_to(@emitter, :notice => 'El Emisor se ha creado exitosamente.') 
    else
      render :action => "new" 
    end
  end

  def update
    @emitter = Emitter.find(params[:id])
    @titulo = "Editar Perfil"
    if @emitter.update_attributes(params[:emitter])
      redirect_to(@emitter, :notice => 'El Emisor se ha actualizado exitosamente.') 
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
