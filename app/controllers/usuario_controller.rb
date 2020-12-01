class UsuarioController < ApplicationController
    def index
    end

	def show
  	@usuario=Usuario.find(current_usuario.id)

  end
  def comprarpasaje
  	@viaje= Viaje.find(params[:id])
  	@chofer= Usuario.find(@viaje.chofer)
  	@combi= Combi.find(@viaje.combi)
  	@ruta= Rutum.find(@viaje.ruta)
  	@origen= Lugar.find(@ruta.origen)
  	@destino= Lugar.find(@ruta.destino)
  	@producto= Producto.where("stock > ? AND eliminado=?",0,false)
  	if params[:pasaje]
  		@pasaje = Pasaje.find(params[:pasaje])
  	else
  		@pasaje = Pasaje.new
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

  end
  def crearinvitado
  	@invitado = Invitado.new
  	respond_to do |format|
  		format.js
  	end 
  end

  def VerViajesUsuario

    #@viajesusuario= Viaje.all #necesito los vijaes del usuario actual,no todos, no .all
  	@pasajesusuario= current_usuario.pasajes
    @chofer= Usuario.all 
    @combi=Combi.all
    @ruta=Rutum.all 
    @lugar=Lugar.all 
    @calificacion=Calificacion.where(usuario_id: current_usuario)
    
  end
  def agregarproducto
  	@producto = Producto.find(params[:producto])
  	@pasaje = Pasaje.find(params[:pasaje])
  	if @pasaje.productos.exists?(params[:producto])
  		pr= PasajesProducto.find_by(pasaje_id: params[:pasaje],producto_id: params[:producto])
  		pr.cantidad += 1
  		pr.save
  	else
  		@pasaje.productos << @producto
  	end
  	redirect_to comprarpasaje_usuario_path(:id => params[:viaje],:pasaje => @pasaje)
  	#@pasaje.save
  end

  def cancelarproducto
  	pasaje = Pasaje.find(params[:pasaje])
  	producto = Producto.find(params[:producto])
  	relacion = PasajesProducto.find_by(pasaje_id: params[:pasaje],producto_id: params[:producto])
  	if !relacion.nil?
  		if relacion.cantidad > 1
  			relacion.cantidad -= 1
  			relacion.save
  		else
  			pasaje.productos.delete(producto)
  		end
  	end  	
  	redirect_to comprarpasaje_usuario_path(:id => params[:viaje],:pasaje => pasaje)  	
  end
  	
end
