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
        redirect_to(:action => "ejc")
      elsif user.profile_id == 2
        @perfil_name = "Supervisor"
        redirect_to(:action => "sup")
      elsif user.profile_id == 3
        @perfil_name = "Jefe de Terreno"
        redirect_to(:action => "jtr")
      elsif user.profile_id == 4
        @perfil_name = "Tesoreria"
        redirect_to(:action => "tsr")
      elsif user.profile_id == 5
        @perfil_name = "Operaciones"
        redirect_to(:action => "opr")
      elsif user.profile_id == 6
        @perfil_name = "Gerencia"
        redirect_to(:action => "ger")
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
    @rechs = Receipt.where("state='rechazado'").where("area='Supervisor'").where("user_name=?", current_user.name)
    @recht = Receipt.where("state='recibido rechazo'").where("area='Cobranza'").where("subarea='Terreno'").where("user_name=?", current_user.name)
  end
  def sup
    @perfil_name = "Supervisor"
    @rech = Receipt.where("state='rechazado'").where("area='Tesoreria'").where("group_id=?", current_user.group_id)
  end
  def jtr
    @perfil_name = "Jefe de Terreno"
    @rech = Receipt.where("state='rechazado'").where("area='Supervisor'")
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
  def dsg
    @perfil_name = "Designer"
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end

