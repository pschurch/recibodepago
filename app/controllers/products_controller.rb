class ProductsController < ApplicationController
  def index
    @products = Product.all
    @titulo = "Listado de Productos"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  def show
    @product = Product.find(params[:id])
    @titulo = "Ver Producto"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  def new
    @product = Product.new
    @titulo = "Crear Producto"
    @perfil_name = "Administrador"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  def edit
    @product = Product.find(params[:id])
    @titulo = "Editar Producto"
    @perfil_name = "Administrador"
  end

  def create
    @product = Product.new(params[:product])
    @titulo = "Crear Producto"
    @perfil_name = "Administrador"
    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product, :notice => 'El Producto se ha creado exitosamente.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @product = Product.find(params[:id])
    @titulo = "Editar Producto"
    @perfil_name = "Administrador"
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'El Producto se ha actualizado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
end
