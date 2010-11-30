class SessionsController < ApplicationController
  def new
    @titulo_unico = "Ingreso a la Aplicacion"
  end

  def create
    @titulo_unico = "Ingreso a la Aplicacion"
    @nombre = params[:session][:user]
    user = User.authenticate(params[:session][:user],
                             params[:session][:password])
    if user.nil?
      flash[:notice] = "Error al ingresar Usuario/Password"
      render 'new'
    else
      flash[:notice] = "Bienvenido " + @nombre
      render 'new'
    end
  end
end
