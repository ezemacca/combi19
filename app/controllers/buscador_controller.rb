class BuscadorController < ApplicationController
  def create
  	origen = params[:origen]
  	destino = params[:destino]
  	fecha = params[:viaje]
  	o = Lugar.find_by(ciudad: origen)
  	d = Lugar.find_by(ciudad: destino)
  	@viajes = Viaje.where(origen: o.id,destino: d.id)
  end
end
