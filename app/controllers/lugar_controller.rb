class LugarController < ApplicationController
  
  def index
  end
  #Parametros de lugar

  def edit
    @lugar = Lugar.find(params[:id])
  end
  
  def update
  @lugar = Lugar.find(params[:id])
    if @lugar.update(lugar_params)

      redirect_to lugar_index_path, notice: "El Lugar se actualizo correctamente"
    else
      redirect_to lugar_index_path,notice: "Error al actualizar el lugar, ya existe ese lugar"
    end
  end 


  def create
    @lugar = Lugar.new(params.require(:lugar).permit(:provincia, :ciudad))

     if @lugar.save 
        redirect_to new_lugar_path, notice:"Lugar se agrego correctamente"
	   else
	    redirect_to new_lugar_path, notice: "Error al agregar lugar, la ciudad ya existe"
	   end
  end

  def destroy
    @lugar = Lugar.find(params[:id])
    @lugar.destroy
    redirect_to lugar_index_path, notice: "El lugar se elimino correctamente"
  end

  private
  def lugar_params
    params.require(:lugar).permit(:provincia, :ciudad)
  end

end

