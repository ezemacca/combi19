class ViajesController < ApplicationController
  before_action :set_viaje, only: [:show, :edit, :update, :destroy]

  # GET /viajes
  # GET /viajes.json
  def index
    @viajes = Viaje.all
    @lugar = Lugar.all
    @ruta = Rutum.all
    @combi = Combi.all
    @usuario = Usuario.all
  end

  # GET /viajes/1
  # GET /viajes/1.json
  def show
    @viaje = Viaje.find(params[:id])
    @lugar = Lugar.all
    @ruta = Rutum.all
    @combi = Combi.all
    @usuario = Usuario.all
  end

  # GET /viajes/new
  def new
    @viaje = Viaje.new
    @lugar = Lugar.where(eliminado: false)
    @ruta = Rutum.where(eliminado: false)
    @combi = Combi.where(eliminado: false)
    @chofer = Usuario.where(role: "chofer", eliminado: false)
  end

  # GET /viajes/1/edit
  def edit
    @lugar = Lugar.where(eliminado: false)
    @ruta = Rutum.where(eliminado: false)
    @combi = Combi.where(eliminado: false)
    @chofer = Usuario.where(role: "chofer",eliminado: false)
  end

  # POST /viajes
  # POST /viajes.json
  def create
    @viaje = Viaje.new(viaje_params)
      #if @viaje.validacion_fecha
        #respond_to do |format|
          if @viaje.save
            redirect_to @viaje, notice: "El viaje se agrego correctamente"
            #format.html { redirect_to @viaje, notice: "El viaje se agrego correctamente" }
            #format.json { render :show, status: :created, location: @viaje }
          else
            flash[:error]
            render :new
            #format.html { render :new }
            #format.json { render json: @viaje.errors, status: :unprocessable_entity }
          end
        #end
      #else
        #redirect_to new_viaje_path, notice: "La combi ya tiene asignado un viaje a esa hora, o la fecha ya paso"
      #end
  end

  # PATCH/PUT /viajes/1
  # PATCH/PUT /viajes/1.json
  def update
        respond_to do |format|
          if @viaje.update(viaje_params)
            format.html { redirect_to @viaje, notice: 'Viaje se modifico correctamente.' }
            format.json { render :show, status: :ok, location: @viaje }
          else
            format.html { render :edit }
            format.json { render json: @viaje.errors, status: :unprocessable_entity }
          end
        end
  end

  # DELETE /viajes/1
  # DELETE /viajes/1.json
  def destroy
    @viaje.eliminado = true
    @viaje.save
    redirect_to viajes_path, notice: "Se elimino correctamente"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_viaje
      @viaje = Viaje.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def viaje_params
      params.require(:viaje).permit(:fecha, :ruta, :fecha_llegada, :combi, :chofer, :eliminado)
    end
end
