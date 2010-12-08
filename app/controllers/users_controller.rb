class UsersController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate_adm

  def index
    @users = User.all
    @titulo = "Listado de Usuarios"
  end

  def show
    @user = User.find(params[:id])
    @titulo = "Ver Usuario"
  end

  def new
    @user = User.new
    @titulo = "Crear Usuario"
  end

  def edit
    @user = User.find(params[:id])
    @titulo = "Editar Usuario"
  end

  def create
    @user = User.new(params[:user])
    @titulo = "Crear Usuario"
    if @user.save
      redirect_to(@user, :notice => 'El Usuario se ha creado exitosamente.') 
    else
      render :action => "new" 
    end
  end

  def update
    @user = User.find(params[:id])
    @titulo = "Editar Usuario"
    if @user.update_attributes(params[:user])
      redirect_to(@user, :notice => 'El Usuario se ha actualizado exitosamente.') 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(users_url) 
  end

  private
    def perfil_name
      @perfil_name = "Administrador"
    end
end
