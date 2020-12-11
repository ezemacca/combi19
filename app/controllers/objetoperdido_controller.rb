class ObjetoperdidoController < ApplicationController

	def new
		@objetoperdido = Objetoperdido.new
		@viaje = params[:id]		
	end

	def create
		@objetoperdido = Objetoperdido.new(objeto_params)
		@objetoperdido.viaje_id = params[:viaje]
		if @objetoperdido.save
			redirect_to	historialviajes_vistachofer_index_path(:id => @objetoperdido.viaje_id), notice: "El objeto se registro correctamente"
		else
			render :new		
		end
	end

	def show
		@viaje = Viaje.find(params[:id])
		@lugar = Lugar.all
		@ruta = Rutum.all		
	end

	def index
		@objetoperdidos = Objetoperdido.all		
	end

	def destroy
		@objetoperdido = Objetoperdido.find(params[:id])
		viaje = @objetoperdido.viaje_id
		@objetoperdido.destroy
		redirect_to objetoperdido_index_path(:viaje => viaje), notice: "El objeto se elimino correctamente"		
	end


	private
	def objeto_params
		params.require(:objetoperdido).permit(:nombre, :descripcion)		
	end

end
