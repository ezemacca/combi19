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

end