class ExpresController < ApplicationController
	def viajesencurso
		@viajes = Viaje.where(estado: "en curso")
		@lugar = Lugar.all
    	@ruta = Rutum.all
    	@combi = Combi.all
	end

	def comprarexpres
		@usuario= Usuario.new
		@contrasena= "123456"
		@viaje = Viaje.find(params[:id])
	end
	def confirmarusuario
		@viaje = Viaje.find(params[:viaje])
		
		@usuario = Usuario.new(params.require(:usuario).permit([:email, :password, :password_confirmation,:nombre, :apellido, :DNI]))
		#@usuario = Usuario.new( email: params[:email], encrypted_password: params[:password], nombre: params[:nombre], apellido: params[:apellido], DNI: params[:DNI]) 
		@usuario.suscripcion = false
		@usuario.role = "expres"
		if @usuario.save						
			@pasaje = Pasaje.new(precio: @viaje.precio, viaje_id: @viaje.id, usuario_id: @usuario.id)			
			@pasaje.save
			@viaje.asientos -= 1
			#UsuarioMailer.with(usuario: @us, pasaje: @pasaje).compraexpres.deliver_now
			redirect_to expre_path(:id => @pasaje.id)
  			
  				
		else
			redirect_to comprarexpres_expres_path(:id => @viaje), notice: "Ya estas registrado en el sistema"
		end		
	end
	def show
		@pasaje = Pasaje.find(params[:id])
  		@usuario = Usuario.find(@pasaje.usuario_id)
  		@viaje = Viaje.find(@pasaje.viaje_id)
  		@combi= Combi.find(@viaje.combi)
  		@ruta= Rutum.find(@viaje.ruta)
  		@origen= Lugar.find(@ruta.origen)
  		@destino= Lugar.find(@ruta.destino)
	end
	def rolexpres

	end
	def actualizarcuenta
		@usuario = current_usuario
		@usuario.role = "usuario"
		if @usuario.update(params.require(:usuario).permit([:email, :password, :password_confirmation,:nombre, :apellido, :DNI, :suscripcion, :nrotarjeta, :vencimientoMes, :vencimientoAño, :codseguridad ]))
			redirect_to root_path, notice: "Se actualizo correctamente"
		else
			render :rolexpres
		end
	end

end
