class SessionsController < ApplicationController
  def new
    @titulo_unico = "Ingreso a la Aplicacion"
  end

  def create
    user = User.authenticate(params[:session][:user],
                             params[:session][:password])
    if user.nil?
      if signed_in?
        sign_out
      end
      @titulo_unico = "Ingreso a la Aplicacion"
      flash[:notice] = "Error al ingresar Usuario/Password"
      render 'new'
    else
      sign_in user
      if user.profile_id == 1
        @perfil_name = "Ejecutivo de Cobranza"
        render 'ejc'
      elsif user.profile_id == 2
        @perfil_name = "Supervisor"
        render 'sup'
      elsif user.profile_id == 3
        @perfil_name = "Jefe de Terreno"
        render 'jtr'
      elsif user.profile_id == 4
        @perfil_name = "Tesoreria"
        render 'tsr'
      elsif user.profile_id == 5
        @perfil_name = "Operaciones"
        render 'opr'
      elsif user.profile_id == 6
        @perfil_name = "Gerencia"
        render 'ger'
      elsif user.profile_id == 7
        @perfil_name = "Administrador"
        render 'adm'
      elsif user.profile_id == 8
        @perfil_name = "Designer"
        render 'dsg'
      else
        flash[:notice] = "El Perfil no es valido: " + user.profile_id.to_s
        render 'new'
      end   
    end
  end

  def ejc
    @perfil_name = "Ejecutivo de Cobranza"
  end
  def sup
    @perfil_name = "Supervisor"
  end
  def jtr
    @perfil_name = "Jefe de Terreno"
  end
  def tsr
    @perfil_name = "Tesoreria"
  end
  def opr
    @perfil_name = "Operaciones"
  end
  def ger
    @perfil_name = "Gerencia"
  end
  def adm
    @perfil_name = "Administrador"
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end

