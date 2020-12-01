class UsuarioMailer < ApplicationMailer
	default from: 'serviciocombi19@gmail.com'
	
	def confirmacion_compra
		@pasaje1= params[:pasaje]
    	@usuario1 =  params[:usuario]    	
    	mail(to: @usuario1.email, subject: 'Combi-19 Notifiacion') #con (, pasaje: @pasaje1) no anda
  	end
end
