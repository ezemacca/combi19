class PasajesController < ApplicationController
  before_action :set_pasaje, only: [:show, :edit, :update, :destroy]

  # GET /pasajes
  # GET /pasajes.json
  def index
    @pasajes = Pasaje.all
  end

  # GET /pasajes/1
  # GET /pasajes/1.json
  def show
  end

  # GET /pasajes/new
  def new
    @pasaje = Pasaje.new
  end

  # GET /pasajes/1/edit
  def edit
  end

  # POST /pasajes
  # POST /pasajes.json
  def create
    @pasaje = Pasaje.new(pasaje_params)

    respond_to do |format|
      if @pasaje.save
        format.html { redirect_to @pasaje, notice: 'Pasaje was successfully created.' }
        format.json { render :show, status: :created, location: @pasaje }
      else
        format.html { render :new }
        format.json { render json: @pasaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pasajes/1
  # PATCH/PUT /pasajes/1.json
  def update
    respond_to do |format|
      if @pasaje.update(pasaje_params)
        format.html { redirect_to @pasaje, notice: 'Pasaje was successfully updated.' }
        format.json { render :show, status: :ok, location: @pasaje }
      else
        format.html { render :edit }
        format.json { render json: @pasaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pasajes/1
  # DELETE /pasajes/1.json
  def destroy
    @pasaje.destroy
    respond_to do |format|
      format.html { redirect_to pasajes_url, notice: 'Pasaje was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pasaje
      @pasaje = Pasaje.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pasaje_params
      params.require(:pasaje).permit(:precio, :)
    end
end
