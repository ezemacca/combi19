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
  def confirmar_compra


  	redirect_to usuario_index_path, notice:"La compra se ha realizado (Mentira)"


  end
 def agregar_producto

 	redirect_to usuario_index_path, notice:"Procuto Agregado"

	end
end
