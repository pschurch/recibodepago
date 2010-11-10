class CollectionTypesController < ApplicationController
  def index
    @collection_types = CollectionType.all
    @titulo = "Listado de Tipos de Cobranza"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @collection_types }
    end
  end
  def show
    @collection_type = CollectionType.find(params[:id])
    @titulo = "Ver Tipo de Cobranza"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @collection_type }
    end
  end

  def new
    @collection_type = CollectionType.new
    @titulo = "Crear Tipo de Cobranza "
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @collection_type }
    end
  end

  def edit
    @collection_type = CollectionType.find(params[:id])
    @titulo = "Editar Tipo de Cobranza "
    @perfil_name = "Administrador"
  end

  def create
    @collection_type = CollectionType.new(params[:collection_type])
    @titulo = "Crear Tipo de Cobranza "
    @perfil_name = "Administrador"

    respond_to do |format|
      if @collection_type.save
        format.html { redirect_to(@collection_type, :notice => 'El Tipo de Cobranza se ha creado exitosamente.') }
        format.xml  { render :xml => @collection_type, :status => :created, :location => @collection_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @collection_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @collection_type = CollectionType.find(params[:id])
    @titulo = "Editar Tipo de Cobranza "
    @perfil_name = "Administrador"
    respond_to do |format|
      if @collection_type.update_attributes(params[:collection_type])
        format.html { redirect_to(@collection_type, :notice => 'El Tipo de Cobranza se ha actualizado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @collection_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @collection_type = CollectionType.find(params[:id])
    @collection_type.destroy
    respond_to do |format|
      format.html { redirect_to(collection_types_url) }
      format.xml  { head :ok }
    end
  end
end

