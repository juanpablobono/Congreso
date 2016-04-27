class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize

  rescue_from ActionController::RoutingError, with: -> { render_404  }
  rescue_from ActionController::UnknownController, with: -> { render_404  }

  protected 

    def render_404
      respond_to do |format|
        format.html { render template: 'errors/not_found', status: 404 }
        format.all { render nothing: true, status: 404 }
      end
    end

    def authorize
      unless Administrador.find_by(id: session[:admin_id])
        redirect_to login_url, notice: "Por favor, inicie sesión."
      end
    end
end
