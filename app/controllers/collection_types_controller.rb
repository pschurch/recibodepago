class CollectionTypesController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_adm 

  def index
    @collection_types = CollectionType.all
    @titulo = "Listado de Tipos de Cobranza"
  end

  def show
    @collection_type = CollectionType.find(params[:id])
    @titulo = "Ver Tipo de Cobranza"
  end

  def new
    @collection_type = CollectionType.new
    @titulo = "Crear Tipo de Cobranza "
  end

  def edit
    @collection_type = CollectionType.find(params[:id])
    @titulo = "Editar Tipo de Cobranza "
  end

  def create
    @collection_type = CollectionType.new(params[:collection_type])
    @titulo = "Crear Tipo de Cobranza "
    if @collection_type.save
      redirect_to(@collection_type, :notice => 'El Tipo de Cobranza se ha creado exitosamente.') 
    else
      render :action => "new" 
    end
  end

  def update
    @collection_type = CollectionType.find(params[:id])
    @titulo = "Editar Tipo de Cobranza "
    if @collection_type.update_attributes(params[:collection_type])
      redirect_to(@collection_type, :notice => 'El Tipo de Cobranza se ha actualizado exitosamente.') 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @collection_type = CollectionType.find(params[:id])
    @collection_type.destroy
    redirect_to(collection_types_url) 
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

