class SessionsController < ApplicationController
  skip_before_action :authorize
  
  def new
    if Administrador.find_by(id: session[:admin_id])
      redirect_to eventos_url
    end
  end

  def create
  	admin = Administrador.find_by(usuario: params[:usuario])
  	if admin and admin.authenticate(params[:password])
  		session[:admin_id] = admin.id
  		redirect_to eventos_url
  	else
  		redirect_to login_url, alert: "Usuario o contraseña inválidos"
  	end
  end

  def destroy
  	session[:admin_id] = nil
  	redirect_to login_url, notice: "La sesión ha finalizado."
  end
end
