module SessionsHelper

  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    current_user = user 
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    current_user = nil
  end

  def current_user?(user)
    user == current_user
  end

  def deny_access
    store_location
    if signed_in?
      sign_out
    end
    redirect_to root_path, :notice => "Ingrese Usuario/Password para acceder a la Aplicacion."
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def authenticate
    deny_access unless signed_in?
  end
  def authenticate_sup
    deny_access unless (signed_in? && (current_user.profile_id == 2 or current_user.profile_id == 8) )
  end
  def authenticate_tsr
    deny_access unless (signed_in? && (current_user.profile_id == 4 or current_user.profile_id == 8) )
  end
  def authenticate_adm
    deny_access unless (signed_in? && (current_user.profile_id == 7 or current_user.profile_id == 8) )
  end
  def authenticate_dsg
    deny_access unless (signed_in? && current_user.profile_id == 8)
  end
  def authenticate_tck
    deny_access unless (signed_in? && (current_user.profile_id==1 or current_user.profile_id == 2 or current_user.profile_id==3 or current_user.profile_id==4 or current_user.profile_id==6 or current_user.profile_id== 8) )
  end

# Revisar si son usadas:
  def authenticate_ejc
    deny_access unless (signed_in? && (current_user.profile_id == 1 or current_user.profile_id == 8) )
  end
  def authenticate_jtr
    deny_access unless (signed_in? && current_user.profile_id == 3)
  end
  def authenticate_opr
    deny_access unless (signed_in? && current_user.profile_id == 5)
  end
  def authenticate_ger
    deny_access unless (signed_in? && current_user.profile_id == 6)
  end
#==========================

  private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end
end
