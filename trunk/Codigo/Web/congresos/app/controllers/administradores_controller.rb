class AdministradoresController < ApplicationController
  before_action :set_administrador, only: [:show, :edit, :update, :destroy]
  before_action :set_activo, only: [:show ]

  # GET /administradores
  # GET /administradores.json
  def index
    @administradores = Administrador.order(:usuario)
  end

  # GET /administradores/1
  # GET /administradores/1.json
  def show
  end

  # GET /administradores/new
  def new
    @administrador = Administrador.new
  end

  # GET /administradores/1/edit
  def edit
  end

  # POST /administradores
  # POST /administradores.json
  def create
    @administrador = Administrador.new(administrador_params)

    respond_to do |format|
      if @administrador.save
        format.html { redirect_to administradores_url, notice: 'El administrador ha sido creado con éxito.' }
        format.json { render :show, status: :created, location: @administrador }
      else
        format.html { render :new }
        format.json { render json: @administrador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administradores/1
  # PATCH/PUT /administradores/1.json
  def update
    admin = Administrador.find_by(id: @administrador.id).try(:authenticate, params[:current_password])
    respond_to do |format|
      if admin and @administrador.update(administrador_params)
        format.html { redirect_to administradores_url, notice: 'El administrador se ha actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @administrador }
      else
        unless admin
          flash[:alert] = "Contraseña actual incorrecta."
        end
        format.html { render :edit }
        format.json { render json: @administrador.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_password

  end

  # DELETE /administradores/1
  # DELETE /administradores/1.json
  def destroy
    begin  
      @administrador.destroy
      flash[:notice] = "El administrador se ha eliminado correctamente."
    rescue StandardError => e
      flash[:notice] = e.message
    end
    respond_to do |format|
      format.html { redirect_to administradores_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrador
      @administrador = Administrador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administrador_params
      params.require(:administrador).permit(:nombre, :apellido, :usuario, :password, 
        :password_confirmation, :tipo, :telefono, :email, :activo, :current_password)
    end

    def set_activo
      @activo = @administrador.activo? ? "Sí" : "No"
    end
end
