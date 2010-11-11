class PrincipalsController < ApplicationController
  def index
    @principals = Principal.all
    @titulo = "Listado de Mandantes"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @principals }
    end
  end

  def show
    @principal = Principal.find(params[:id])
    @titulo = "Ver Mandante"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @principal }
    end
  end

  def new
    @principal = Principal.new
    @titulo = "Crear Mandante"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @principal }
    end
  end

  def edit
    @principal = Principal.find(params[:id])
    @titulo = "Editar Editar Mandante"
    @perfil_name = "Administrador"
  end

  def create
    @principal = Principal.new(params[:principal])
    @titulo = "Crear Mandante"
    @perfil_name = "Administrador"
    respond_to do |format|
      if @principal.save
        format.html { redirect_to(@principal, :notice => 'El Mandante se ha creado exitosamente.') }
        format.xml  { render :xml => @principal, :status => :created, :location => @principal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @principal.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @principal = Principal.find(params[:id])
    @titulo = "Editar Mandante"
    @perfil_name = "Administrador"
    respond_to do |format|
      if @principal.update_attributes(params[:principal])
        format.html { redirect_to(@principal, :notice => 'El Mandante se ha actualizado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @principal.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @principal = Principal.find(params[:id])
    @principal.destroy

    respond_to do |format|
      format.html { redirect_to(principals_url) }
      format.xml  { head :ok }
    end
  end
end
