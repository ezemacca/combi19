class CalificacionsController < ApplicationController
  before_action :set_calificacion, only: [:show, :edit, :update, :destroy]

  # GET /calificacions
  # GET /calificacions.json
  def index
    @pasajes = current_usuario.pasajes
    @calificacions = Calificacion.all
  end

  # GET /calificacions/1
  # GET /calificacions/1.json
  def show
  end

  # GET /calificacions/new
  def new
    @pasaje = params[:id]
    #@calificacion = Calificacion.new

    @calificacion = Calificacion.new
  end

  # GET /calificacions/1/edit
  def edit
    @calificacion = Calificacion.find(params[:id])
    @pasaje = params[:pasaje]

  end

  # POST /calificacions
  # POST /calificacions.json
  def create
    #@calificacion = Calificacion.new(calificacion_params)
    @calificacion = Calificacion.new(calificacion_params)
    @pasaje = params[:pasaje].to_i
    @calificacion.pasaje_id = @pasaje
    #viaje2=Viaje.find(params[:viaje])

    #viaje2.califiacions << @calificacion
    #@calificacion.viaje_id = params[:viaje]
    respond_to do |format|
      if @calificacion.save
        format.html { 
          
        
          redirect_to @calificacion, notice: 'Calificacion creada exitosamente.' }
        format.json { render :show, status: :created, location: @calificacion }
      else
        format.html { render :new }
        format.json { render json: @calificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calificacions/1
  # PATCH/PUT /calificacions/1.json
  def update
    @pasaje = params[:pasaje].to_i
    respond_to do |format|
      if @calificacion.update(calificacion_params)
        format.html { 
          @calificacion.pasaje_id = @pasaje
          @calificacion.save
          redirect_to @calificacion, notice: 'Calificacion se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @calificacion }
      else
        format.html { render :edit }
        format.json { render json: @calificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calificacions/1
  # DELETE /calificacions/1.json
  def destroy
    @calificacion.destroy
    respond_to do |format|
      format.html { redirect_to usuario_VerViajesUsuario_path, notice: 'Calificacion se elimino correctamente' }
      format.json { head :no_content }
    end
  end

  def calificacionesporviaje
   
    @viaje = Viaje.find(params[:id])
    @origen = Lugar.find(Viaje.find(params[:id]).origen)
    @destino =Lugar.find(Viaje.find(params[:id]).destino)
    @usuarios = Usuario.all
    @pasajes = @viaje.pasajes

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calificacion
      @calificacion = Calificacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def calificacion_params
      params.require(:calificacion).permit(:puntaje, :comentario, :viaje_id)
    end
end
