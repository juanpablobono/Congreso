class InscripcionesController < ApplicationController
  before_action :set_inscripcion, only: [:show, :edit, :update, :destroy]

  # GET /inscripciones
  # GET /inscripciones.json
  def index
    @inscripciones = Inscripcion.all
  end

  # GET /inscripciones/1
  # GET /inscripciones/1.json
  def show
  end

  # GET /inscripciones/new
  def new
    @inscripcion = Inscripcion.new
  end

  # GET /inscripciones/1/edit
  def edit
  end

  # POST /inscripciones
  # POST /inscripciones.json
  def create
    @inscripcion = Inscripcion.new(inscripcion_params)

    respond_to do |format|
      if @inscripcion.save
        format.html { redirect_to @inscripcion, notice: 'Enrollment was successfully created.' }
        format.json { render :show, status: :created, location: @inscripcion }
      else
        format.html { render :new }
        format.json { render json: @inscripcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inscripciones/1
  # PATCH/PUT /inscripciones/1.json
  def update
    respond_to do |format|
      if @inscripcion.update(inscripcion_params)
        format.html { redirect_to @inscripcion, notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @inscripcion }
      else
        format.html { render :edit }
        format.json { render json: @inscripcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inscripciones/1
  # DELETE /inscripciones/1.json
  def destroy
    @inscripcion.destroy
    respond_to do |format|
      format.html { redirect_to inscripciones_url, notice: 'Enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inscripcion
      @inscripcion = Inscripcion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inscripcion_params
      params.require(:inscripcion).permit(:fecha_alta)
    end
end
