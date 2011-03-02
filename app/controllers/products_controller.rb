class ProductsController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_adm
 
  def index
    @products = Product.all
    @titulo = "Listado de Productos"
  end

  def show
    @product = Product.find(params[:id])
    @titulo = "Ver Producto"
  end

  def new
    @product = Product.new
    @titulo = "Crear Producto"
  end

  def edit
    @product = Product.find(params[:id])
    @titulo = "Editar Producto"
  end

  def create
    @product = Product.new(params[:product])
    @titulo = "Crear Producto"
    if @product.save
      redirect_to(@product, :notice => 'El Producto se ha creado exitosamente.') 
    else
      render :action => "new" 
    end
  end

  def update
    @product = Product.find(params[:id])
    @titulo = "Editar Producto"
    if @product.update_attributes(params[:product])
      if !@product.state   #El estado del Producto es inactivo
        @cartera = Cartera.where("product_id =?", params[:id])
        @cartera.each do |c|
          idc = c.id.to_s
          @cargrups = Cargrup.where("cartera_id=?", idc)
          @cargrups.each do |cg|
            cg.destroy
          end
          c.destroy
        end   
      end 
      redirect_to(@product, :notice => 'El Producto se ha actualizado exitosamente.') 
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
