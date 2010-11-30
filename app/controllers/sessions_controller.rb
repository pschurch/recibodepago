class SessionsController < ApplicationController
  def new
    @titulo_unico = "Ingreso a la Aplicacion"
  end

  def create
    @titulo_unico = "Ingreso a la Aplicacion"
    user = User.authenticate(params[:session][:user],
                             params[:session][:password])
    if user.nil?
      flash[:notice] = "Error al ingresar Usuario/Password"
      render 'new'
    else
      if user.profile_id = 1
        flash[:notice] = "Bienvenido " + user.name + "!"
      end      
      sign_in user
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end

