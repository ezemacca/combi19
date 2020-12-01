class UsuarioMailer < ApplicationMailer
	default from: 'serviciocombi19@gmail.com'
	
	def confirmacion_compra
    	@usuario1 =  params[:usuario]
    	
    	mail(to: @usuario1.email, subject: 'Combi-19 Notifiacion')
  	end
end
