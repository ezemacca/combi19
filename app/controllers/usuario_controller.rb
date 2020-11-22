class UsuarioController < ApplicationController
  def show
  	@usuario=Usuario.find(current_usuario.id)

  end

  def index
  	@usuario=current_usuario.id
  	@lugar= Lugar.all
  	@ruta= Rutum.all
  	@combi= Combi.all
  	@chofer= Usuario.all

  	origen = params[:origen]
  	destino = params[:destino]
  	fecha = params[:fecha]
  	fecha1 = fecha.to_s
  	fecha2 = fecha1.to_datetime
  	if params[:origen] && params[:destino] && params[:fecha]
  		o = Lugar.find_by(ciudad: origen)
  		d = Lugar.find_by(ciudad: destino)
  		if !o.nil? && !d.nil?
  			@viajes = Viaje.where(origen: o.id,destino: d.id,fecha: fecha2..fecha2.end_of_day)
  		else
  			if o.nil?
  				@notice = "No hay ningun viaje con origen #{origen}"
  			elsif d.nil?  				
  				@notice = "No hay ningun viaje con destino #{destino}"  				
  			end
  		end
  	end
  end
  def edit
  	@usuario=Usuario.find(current_usuario.id)
  end
  
end
