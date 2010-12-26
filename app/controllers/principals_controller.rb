class PrincipalsController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_adm

  def index
    @principals = Principal.all
    @titulo = "Listado de Mandantes"
  end

  def show
    @principal = Principal.find(params[:id])
    @titulo = "Ver Mandante"
  end

  def new
    @principal = Principal.new
    @titulo = "Crear Mandante"
  end

  def edit
    @principal = Principal.find(params[:id])
    @titulo = "Editar Editar Mandante"
  end

  def create
    @principal = Principal.new(params[:principal])
    @titulo = "Crear Mandante"
    if @principal.save
      redirect_to(@principal, :notice => 'El Mandante se ha creado exitosamente.') 
    else
      render :action => "new" 
    end
  end

  def update
    @principal = Principal.find(params[:id])
    @titulo = "Editar Mandante"
    if @principal.update_attributes(params[:principal])
      redirect_to(@principal, :notice => 'El Mandante se ha actualizado exitosamente.') 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @principal = Principal.find(params[:id])
    @principal.destroy
    redirect_to(principals_url) 
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
