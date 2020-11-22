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
  end
  def edit
  	@usuario=Usuario.find(current_usuario.id)
  end
  def confirmar
  	
  	
  end
end
