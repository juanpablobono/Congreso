class CursosController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy]
  before_action :set_activo, only: [:show ]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_curso

  # GET /cursos
  # GET /cursos.json
  # def index
  #   @cursos = Curso.all
  # end

  # GET /cursos/1
  # GET /cursos/1.json
  def show
  end

  # GET /cursos/new
  def new
    @curso = Curso.new
    @curso.evento_id = params[:evento_id]
  end

  # GET /cursos/1/edit
  def edit
    @dia_hora_str = @curso.dia_hora.strftime("%d %m %Y %H %M")
  end

  # POST /cursos
  # POST /cursos.json
  def create
    evento = Evento.find(params[:evento_id])
    @curso = evento.cursos.build(curso_params)

    respond_to do |format|
      if @curso.save
        format.html { redirect_to @curso.evento, notice: "El curso ha sido creado con éxito." }
        format.json { render :show, status: :created, location: @curso }
      else
        format.html { render :new }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cursos/1
  # PATCH/PUT /cursos/1.json
  def update
    respond_to do |format|
      if @curso.update(curso_params)
        format.html { redirect_to @curso, notice: 'El curso sa ha actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @curso }
      else
        format.html { render :edit }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    evento = @curso.evento
    @curso.destroy
    respond_to do |format|
      format.html { redirect_to evento, notice: 'El curso se ha eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curso
      @curso = Curso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_params
      params.require(:curso).permit(:nombre, :descripcion, :activo, :dia_hora, :duracion, :evento_id)
    end

    def set_activo
      @activo = @curso.activo? ? "Sí" : "No"
    end

    def invalid_curso
      logger.error "Está intentando acceder a un curso inexistente, con ID=#{params[:id]}."
      redirect_to eventos_url, notice: "Curso inválido"
    end
end
