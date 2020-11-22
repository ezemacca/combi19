class UsuarioController < ApplicationController
    def index
    end

	def show
  	@usuario=Usuario.find(current_usuario.id)

  end
  def comprarpasaje
  	@viaje= Viaje.find(3)
  	@chofer= Usuario.find(@viaje.chofer)
  	@combi= Combi.find(@viaje.combi)
  	@ruta= Rutum.find(@viaje.ruta)
  	@origen= Lugar.find(@ruta.origen)
  	@destino= Lugar.find(@ruta.destino)
  	@producto= Producto.where("stock > ? AND eliminado=?",0,false)
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
  def confirmar
  end
  def VerViajesUsuario

    @viajesusuario= Viaje.all #necesito los vijaes del usuario actual,no todos, no .all
  	@chofer= Usuario.all 
    @combi=Combi.all
    @ruta=Rutum.all 
    @lugar=Lugar.all 
    
  end
end
