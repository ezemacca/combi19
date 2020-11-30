class UsuarioMailer < ApplicationMailer
	default from: 'serviciocombi19@gmail.com'
	
	def confirmacion_compra(usuario)
    
    mail(to: usuario, subject: 'Combi-19 Notifiacion')
  end
end
