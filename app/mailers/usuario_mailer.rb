class UsuarioMailer < ApplicationMailer
	default from: 'serviciocombi19@gmail.com'
	
    def confirmacion_compra
		  @pasaje1= params[:pasaje]
    	@usuario1 =  params[:usuario]  
      @viaje = Viaje.find(@pasaje1.viaje_id)
      @combi= Combi.find(@viaje.combi)
      @ruta= Rutum.find(@viaje.ruta)
      @origen= Lugar.find(@ruta.origen)
      @destino= Lugar.find(@ruta.destino)
      @invitados = @pasaje1.invitados  	
    	mail(to: @usuario1.email, subject: 'Combi-19 Notifiacion') #con (, pasaje: @pasaje1) no anda
  	end
  	def cancelarpasaje
  		@pasaje= params[:pasaje]
  		@usuario = params[:usuario]
  		@viaje = Viaje.find(@pasaje.viaje_id)
      @combi= Combi.find(@viaje.combi)
      @ruta= Rutum.find(@viaje.ruta)
      @origen= Lugar.find(@ruta.origen)
      @destino= Lugar.find(@ruta.destino)
  		mail(to: @usuario.email, subject: 'Combi-19 Cancelacion de pasaje')
  	
  	end	
    def compraexpres
      
    end

end