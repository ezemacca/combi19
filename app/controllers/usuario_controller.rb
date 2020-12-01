class UsuarioController < ApplicationController
    def index
    end

	def show
  	@usuario=Usuario.find(current_usuario.id)

  end
  def comprarpasaje
  	@habilitado = 0
  	@viaje= Viaje.find(params[:id])
  	@chofer= Usuario.find(@viaje.chofer)
  	@combi= Combi.find(@viaje.combi)
  	@ruta= Rutum.find(@viaje.ruta)
  	@origen= Lugar.find(@ruta.origen)
  	@destino= Lugar.find(@ruta.destino)
  	@producto= Producto.where("stock >= ? AND eliminado=?",0,false)
  	if params[:pasaje]
  		@pasaje = Pasaje.find(params[:pasaje])
  	else
  		@pasaje = Pasaje.new(precio: @viaje.precio)
  		@pasaje.save
  	end
  	@cantidad = PasajesProducto.where(pasaje_id: @pasaje.id)
  end

def index
  	@usuario=current_usuario.id
  	@lugar= Lugar.all
  	@ruta= Rutum.all
  	@combi= Combi.all
  	@chofer= Usuario.all

  	origen = params[:origen].to_s.downcase
  	destino = params[:destino].to_s.downcase
  	fecha = params[:fecha]
  	fecha1 = fecha.to_s
  	fecha2 = fecha1.to_datetime
    @notice = ""
  if params[:origen] && params[:destino] && params[:fecha]
  		o = Lugar.find_by(ciudad: origen)
  		d = Lugar.find_by(ciudad: destino)
  	if !o.nil? && !d.nil? && !fecha2.nil? && fecha2 > Time.now  
  			@viajes = Viaje.where(origen: o.id,destino: d.id,fecha: fecha2..fecha2.end_of_day)
        if @viajes.count == 0
          @notice = "No se encontraron viajes para ese dia"
        end
  	else
      if fecha2.nil?
          @notice = "Debe ingresar una fecha"
      else  
        if fecha2 < Time.now
          @notice = "Debe ingresar una fecha posterior a la fecha actual"
        else
          if o.nil? && d.nil?
            @notice = "No hay ningun viaje con origen #{origen}, ni con destino #{destino}"
          else
  			    if o.nil?
  			 	   @notice = "No hay ningun viaje con origen #{origen}"
  			    else
  			     	  @notice = "No hay ningun viaje con destino #{destino}" 
  			    end
          end     
  		  end
  	  end
    end
  end  
end

  def edit
  	@usuario=Usuario.find(current_usuario.id)
  end

  def confirmarcompra
  	if params[:habilitado]
  		@habilitado = params[:habilitado]  		
  	end
  	@viaje = Viaje.find(params[:viaje])
  	@pasaje = Pasaje.find(params[:pasaje])
  	@invitados = @pasaje.invitados
  	#se comento para que no sume cada vez que se recargue la pagina
    #if (!@invitados.nil?)
  	#	@pasaje.precio += (@viaje.precio * @invitados.size)
  	#	@pasaje.save
  	#end
  end

  def verificartarjeta
  	@usuario = Usuario.find(current_usuario.id)
  	pasaje = Pasaje.find(params[:pasaje])
  	viaje = Viaje.find(params[:viaje])
  	habilitado = 1
  	if @usuario.suscripcion
  		if @usuario.update(params.require(:usuario).permit(:nrotarjeta, :vencimientoMes, :vencimientoAño,:codseguridad))
  			redirect_to confirmarcompra_usuario_path(:pasaje => pasaje,:viaje => viaje,:habilitado => habilitado), notice: "Se confirmo la tarjeta correctamente"
  		else
  			habilitado = 0
  			redirect_to confirmarcompra_usuario_path(:pasaje => pasaje,:viaje => viaje,:habilitado => habilitado), notice: "No se pudo confirmar la tarjeta"
  		end
  	else
  		@usuario.suscripcion = true
  		if @usuario.update(params.require(:usuario).permit(:nrotarjeta, :vencimientoMes, :vencimientoAño,:codseguridad))
  			@usuario.suscripcion = false
  			@usuario.save
  			redirect_to confirmarcompra_usuario_path(:pasaje => pasaje,:viaje => viaje,:habilitado => habilitado), notice: "Se confirmo la tarjeta correctamente"
  		else
  			habilitado = 0
  			redirect_to confirmarcompra_usuario_path(:pasaje => pasaje,:viaje => viaje,:habilitado => habilitado), notice: "No se pudo confirmar la tarjeta"
  		end
  	end	
  end

  def finalizarcompra
    @us=current_usuario #paraelmailer
  	pasaje = Pasaje.find(params[:pasaje])
    @pasaje1 = pasaje #para el mailer
  	viaje = Viaje.find(params[:viaje])
  	combi = Combi.find(viaje.combi)
  	if (combi.plazas_libres >= pasaje.invitados.size+1)
  		pasaje.usuario_id = current_usuario.id
  		pasaje.viaje_id = viaje.id

      #Verifico si esta suscripto para aplicar el descuento
      if current_usuario.suscripcion 
        pasaje.precio= pasaje.precio*0.9
      end

  		pasaje.save
  		combi.plazas_libres -= (pasaje.invitados.size+1)
  		combi.save
      #le mandamo el mail 
      UsuarioMailer.with(usuario: @us, pasaje: @pasaje1).confirmacion_compra.deliver_now 
  		redirect_to showpasaje_usuario_path(:id => pasaje), notice: "La compra del pasaje se realizo correctamente"      
  	else
  		redirect_to confirmarcompra_usuario_path(:pasaje => pasaje,:viaje => viaje), notice: "No hay los suficientes lugares disponibles para la cantidad de pasajes que queres comprar"
  	end
  end

  def showpasaje
    @pasaje = Pasaje.find(params[:id])
  	@usuario = Usuario.find(@pasaje.usuario_id)
  	@viaje = Viaje.find(@pasaje.viaje_id)
  	@combi= Combi.find(@viaje.combi)
  	@ruta= Rutum.find(@viaje.ruta)
  	@origen= Lugar.find(@ruta.origen)
  	@destino= Lugar.find(@ruta.destino)
  	@invitados = @pasaje.invitados
  	@cantidad = PasajesProducto.where(pasaje_id: @pasaje.id)  	
  end

  def nuevoinvitado
  	@invitado = Invitado.new
  	@viaje = params[:viaje]
  	@pasaje = params[:pasaje]
  end

  def crearinvitado
  	@invitado = Invitado.new(params.require(:invitado).permit(:nombre, :apellido, :DNI))
  	pasaje = Pasaje.find(params[:pasaje])
  	viaje = Viaje.find(params[:viaje])
  	@invitado.pasaje_id = params[:pasaje]
  	if @invitado.save
      pasaje.precio = pasaje.precio+ viaje.precio 
      pasaje.save
  		redirect_to confirmarcompra_usuario_path(:pasaje => pasaje,:viaje => viaje), notice: "Se agregaron los datos del acompañante correctamente"
  	else
  		redirect_to confirmarcompra_usuario_path(:pasaje => pasaje,:viaje => viaje), notice: "No se pudieron agregar los datos del acompañante"	
  	end
  end

  def VerViajesUsuario

    #@viajesusuario= Viaje.all #necesito los vijaes del usuario actual,no todos, no .all
  	@pasajesusuario= current_usuario.pasajes
  	@viajes = Viaje.all
    @chofer= Usuario.all 
    @combi=Combi.all
    @ruta=Rutum.all 
    @lugar=Lugar.all 
    @calificacion=Calificacion.where(usuario_id: current_usuario)
    
  end
  def agregarproducto
  	@producto = Producto.find(params[:producto])
  	@pasaje = Pasaje.find(params[:pasaje])
  	if @producto.stock > 0
  		@producto.stock -= 1
  		@producto.save
  		@pasaje.precio += @producto.precio
  		@pasaje.save 
  		if @pasaje.productos.exists?(params[:producto])
  			pr= PasajesProducto.find_by(pasaje_id: params[:pasaje],producto_id: params[:producto])
  			pr.cantidad += 1
  			pr.save
  		else
  			@pasaje.productos << @producto
  		end
  		redirect_to comprarpasaje_usuario_path(:id => params[:viaje],:pasaje => @pasaje)
  	else
  		redirect_to comprarpasaje_usuario_path(:id => params[:viaje],:pasaje => @pasaje), notice: "Se acabo el stock de #{@producto.nombre}"
  	end
  	#@pasaje.save
  end

  def cancelarproducto
  	pasaje = Pasaje.find(params[:pasaje])
  	producto = Producto.find(params[:producto])
  	producto.stock += 1
  	producto.save
  	
  	relacion = PasajesProducto.find_by(pasaje_id: params[:pasaje],producto_id: params[:producto])
  	if !relacion.nil?
  		if relacion.cantidad > 1
  			relacion.cantidad -= 1
  			relacion.save
  			pasaje.precio -= producto.precio
  			pasaje.save
  		else
  			pasaje.productos.delete(producto)
  			pasaje.precio -= producto.precio
  			pasaje.save
  		end
  	end  	
  	redirect_to comprarpasaje_usuario_path(:id => params[:viaje],:pasaje => pasaje)  	
  end

  def cancelarinvitado
    invitado = Invitado.find(params[:invitado])
    pasaje = Pasaje.find(params[:pasaje])
    viaje = Viaje.find(params[:viaje])
   
    invitado.destroy
    pasaje.precio -= viaje.precio
    pasaje.save

    redirect_to confirmarcompra_usuario_path(:pasaje => pasaje,:viaje => viaje), notice: "Se borro el pasaje del acompañante exitosamente"
  end

  def cancelarpasaje
    @us=current_usuario #paraelmailer
    @pasaje = Pasaje.find(params[:id])
    @productos = @pasaje.productos
    @combi = Combi.find(Viaje.find(@pasaje.viaje_id).combi)
    @productos.each do |p|
      prod = PasajesProducto.find_by(pasaje_id: @pasaje.id, producto_id: p.id)
       p.stock+= prod.cantidad
       p.save
    end
      @combi.plazas_libres+= (@pasaje.invitados.size+1)
      @combi.save
    #enviar mail aca desp de destruirlo
    UsuarioMailer.with(usuario: @us, pasaje: @pasaje).cancelarpasaje.deliver_now
    @pasaje.invitados.destroy_all
    @pasaje.destroy
    redirect_to usuario_VerViajesUsuario_path, notice: "El pasaje se cancelo correctamente, revise su correo para mas informacion"
  end
  	
end
