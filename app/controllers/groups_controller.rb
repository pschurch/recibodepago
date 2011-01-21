class GroupsController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_adm 

  def index
    @groups = Group.all
    @titulo = "Listado de Grupos"
  end

  def show
 #   @cartera_list = Cartera.where("state=true")
   @cartera_list = Cartera.where("state=true")
    @group = Group.find(params[:id])
    @titulo = "Ver Grupo"
  end

  def new
    @group = Group.new
    @titulo = "Crear Grupo"
  end

  def edit
    @group = Group.find(params[:id])
    @titulo = "Editar Grupo"
  end

  def create
    @group = Group.new(params[:group])
    @titulo = "Crear Grupo"
    if @group.save
      redirect_to(@group, :notice => 'El Grupo se ha creado exitosamente.') 
    else
      render :action => "new" 
    end
  end

  def update
    params[:group][:cartera_ids] ||= []
    @group = Group.find(params[:id])
    @titulo = "Editar Grupo"
    if @group.update_attributes(params[:group])
      redirect_to(@group, :notice => 'El Grupo se ha actualizado exitosamente.') 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to(groups_url) 
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
