class RutaController < ApplicationController
  def index
  	@ruta = Rutum.all
  	@lugar = Lugar.all
  end

  def alta
  	@lugar = Lugar.where(eliminado: false)

  end

  def edit
  	@ruta = Rutum.find(params[:id])
  	@lugar = Lugar.all  	
  end

  def create
  	@ruta = Rutum.new((params.require(:ruta).permit(:nombre, :origen, :destino)))
  	if @ruta.save
  		redirect_to ruta_alta_path, notice: "Se agrego la ruta correctamente"
  	else
  		redirect_to ruta_alta_path, notice: "Hubo un error y no se pudo agregar la ruta"
  	end 	
  end

  def destroy
  	@ruta = Rutum.find(params[:id])
    @ruta.destroy
    redirect_to ruta_index_path, notice: "La ruta se elimino correctamente"
  end

  def update
  	@ruta = Rutum.find(params[:id])
 
  	if @ruta.update(ruta_params)
    	redirect_to ruta_index_path, notice: "La ruta se actualizo"
  	else
    	redirect_to ruta_index_path, notice: "La ruta no se pudo actualizar"
  	end
  end
 
private
  def ruta_params
    params.require(:ruta).permit(:nombre, :origen, :destino)
  end
end
