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
         l=Lugar.find_by(ciudad: @lugar.ciudad.downcase, provincia: @lugar.provincia.downcase)
         if !l.nil?
          if l.eliminado
                l.eliminado = false
                l.save
                redirect_to new_lugar_path, notice:"Lugar se agrego correctamente (Se restauro)"
          else
          redirect_to new_lugar_path, notice:"Error porque el lugar ya existe"
          end
        else
         redirect_to new_lugar_path, notice:"Error Porque la ciudad ya existe"
        end
    end
  end

  def destroy
    @lugar = Lugar.find(params[:id])
    @lugar.eliminado = true
    @lugar.save
    ruta = Rutum.where(origen: @lugar.id)
    ruta.each do |r|
      r.eliminado = true
      r.save      
    end
    ruta2 = Rutum.where(destino: @lugar.id)
    ruta2.each do |r2|
      r2.eliminado = true
      r2.save      
    end
    redirect_to lugar_index_path, notice: "El lugar se elimino correctamente"
  end

  private
  def lugar_params
    params.require(:lugar).permit(:provincia, :ciudad)
  end

end

