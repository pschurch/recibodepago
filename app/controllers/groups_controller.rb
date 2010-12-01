class GroupsController < ApplicationController
  before_filter :authenticate 

  def index
    @groups = Group.all
    @titulo = "Listado de Grupos"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groups }
    end
  end

  def show
    @group = Group.find(params[:id])
    @titulo = "Ver Grupo"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group }
    end
  end

  def new
    @group = Group.new
    @titulo = "Crear Grupo"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  def edit
    @group = Group.find(params[:id])
    @titulo = "Editar Grupo"
    @perfil_name = "Administrador"
  end

  def create
    @group = Group.new(params[:group])
    @titulo = "Crear Grupo"
    @perfil_name = "Administrador"
    respond_to do |format|
      if @group.save
        format.html { redirect_to(@group, :notice => 'El Grupo se ha creado exitosamente.') }
        format.xml  { render :xml => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @group = Group.find(params[:id])
    @titulo = "Editar Grupo"
    @perfil_name = "Administrador"
    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to(@group, :notice => 'El Grupo se ha actualizado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.xml  { head :ok }
    end
  end
end
