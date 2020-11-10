class LugarController < ApplicationController
  def index
  
  end
  def edit
  end
  def show

  end
  def create
    @lugar = Lugar.new(params.require(:lugar).permit(:provincia, :ciudad))

    if @lugar.save 
        redirect_to lugar_new_path, notice:"Lugar se agego correctamente"
	 else
	    redirect_to lugar_new_path, notice: "Error al agregar lugar, la ciudad ya existe"
	end
  end

  def destroy
    @lugar = Lugar.find(params[:id])
    @lugar.destroy
    redirect_to lugar_index_path, notice: "El lugar se elimino correctamente"
  end

end
