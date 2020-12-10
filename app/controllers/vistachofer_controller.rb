class VistachoferController < ApplicationController
	def show

	end
	def index
		@viajeschofer= Viaje.where(chofer: Usuario.find(current_usuario.id))
		@lugar = Lugar.all
    	@ruta = Rutum.all
   		@combi = Combi.all
   		@usuario = Usuario.find(current_usuario.id)
	end

	def pasajeros
		@viaje= Viaje.find(params[:id])
		@pasajes= @viaje.pasajes
		@usuario=Usuario.all

	end

	def iniciarviaje 
		@viaje= Viaje.find(params[:id])
		@viaje.estado = "en curso"
		@viaje.save
		@viajeschofer= Viaje.where(chofer: Usuario.find(current_usuario.id))
		@lugar = Lugar.all
    	@ruta = Rutum.all
   		@combi = Combi.all
   		@usuario = Usuario.find(current_usuario.id)
   		redirect_to vistachofer_index_path
	end

	def finalizarviaje
		@viaje= Viaje.find(params[:id])
		@viajeschofer= Viaje.where(chofer: Usuario.find(current_usuario.id))
		@lugar = Lugar.all
    	@ruta = Rutum.all
   		@combi = Combi.all
   		@usuario = Usuario.find(current_usuario.id)
   		

		# aca van todas los controles al finalizar el viaje, volver a cargar los lugares a la combi


		@viaje.estado = "finalizado"
		@viaje.save
		redirect_to vistachofer_index_path

	end

	def historialviajes
		@viajeschoferfinalizados= Viaje.where(chofer: Usuario.find(current_usuario.id),estado: "finalizado")
		@lugar = Lugar.all
    	@ruta = Rutum.all
   		@combi = Combi.all
   		@usuario = Usuario.find(current_usuario.id)
	end

end