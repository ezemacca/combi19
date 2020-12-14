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
   		@pasajes = @viaje.pasajes
   			#Controla si el pasajero viajo (si se le realizo el testeo estuvo presente)	
   			@pasajes.each do |p|
   				if	p.testeo.nil?
   					p.presenciapasajero = "ausente"
   				else
   					if p.testeo.sospechado 
   						p.presenciapasajero = "sospechado"
   						u = Usuario.find(p.usuario_id) 
   						u.baneo = Time.now.to_date + 15
   						u.save	
   					else
   						p.presenciapasajero = "apto"
   					end
   				end
   				if !p.invitados.nil?
   					#Verifica si los invitados viajaron o estan sospechados
   					p.invitados.each do |i|
		   				if	i.testeo.nil?
		   					i.presenciapasajero="ausente"
		   				else
		   					if i.testeo.sospechado 
		   						i.presenciapasajero="sospechado"	
		   					else
		   						i.presenciapasajero="apto"
		   					end
		   				end
		   				i.save
   					end	
   				end
   				p.save	
   			end			
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