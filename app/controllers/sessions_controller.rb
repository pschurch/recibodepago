class SessionsController < ApplicationController
  def new
    @titulo_unico = "Ingreso a la Aplicacion"
  end

  def create
    @nombre = params[:session][:usuario]
    @pass = params[:session][:password]
    flash[:notice] = "Error al ingresar Usuario/Password" + @nombre
      @titulo_unico = "Nulo Ingreso a la Aplicacion " + @nombre

    render 'new'
  end
end
