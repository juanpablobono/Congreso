class EventosController < ApplicationController
  before_action :set_evento, only: [:show, :edit, :update, :destroy]
  before_action :set_cursos, only: [:show ]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_evento

  # GET /eventos
  # GET /eventos.json
  def index
    @eventos = Evento.all
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
  end

  # GET /eventos/1/edit
  def edit
    @fecha_inicio_str = @evento.fecha_inicio.strftime("%d %m %Y")
    @fecha_fin_str = @evento.fecha_fin.strftime("%d %m %Y")
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(evento_params)

    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: 'El evento ha sido creado con éxito.' }
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(event_params)
        format.html { redirect_to @evento, notice: 'El evento sa ha actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to eventos_url, notice: 'El evento sa ha eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit(:fecha_inicio, :fecha_fin, :descripcion, :lugar)
    end

    def set_cursos
      @cursos = @evento.cursos
    end

    def invalid_evento
      logger.error "Está intentando acceder a un evento inexistente, con ID=#{params[:id]}."
      redirect_to eventos_url, notice: "Evento inválido"
    end
end
