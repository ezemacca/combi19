class AgregarLugarController < ApplicationController
  def index
  
  end

  def create
    @lugar = Lugar.new(params.require(:lugar).permit(:provincia, :ciudad))

    if @lugar.save
        redirect_to agregar_lugar_index_path, notice:"Lugar se agego correctamente"
	else
	flash[:Error]= "Error al agregar lugar"
	end 
  end
end
