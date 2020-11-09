class RutaController < ApplicationController
  def alta
  	@lugar = Lugar.all
  end

  def create
  	@ruta = Rutum.new((params.require(:ruta).permit(:nombre, :origen, :destino)))
  	if @ruta.save
  		redirect_to administrador_index_path, notice: "Se agrego la ruta correctamente"
  	else
  	flash[:error]= "Error al agregar ruta"
  	end 	
  end
end
