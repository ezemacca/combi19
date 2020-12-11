class TesteosController < ApplicationController

	def show
		@testeo = Testeo.find(params[:id])		
	end

	def new
		@testeo = Testeo.new
		@pasaje = -1
		@invitado = -1
		if params[:pasaje]
			@pasaje= params[:pasaje]
		else
			@invitado=params[:invitado]
		end

	end

	def create
		@testeo = Testeo.new(testeo_params)
		pasaje = params[:pasaje].to_i
		invitado = params[:invitado].to_i
		if pasaje == -1
			@testeo.invitado_id = invitado
			viaje = Pasaje.find(Invitado.find(invitado).pasaje_id).viaje_id
		else
			@testeo.pasaje_id = pasaje
			viaje = Pasaje.find(pasaje).viaje_id
		end		
		#asignar pasaje
		if @testeo.save
			redirect_to pasajeros_vistachofer_index_path(:id=> viaje), notice: "Se guardo el testeo correctamente"
		else
			render :new
		end
	end

	def edit
		@testeo = Testeo.find(params[:id])
		@pasaje = 0
		@invitado = 0		
	end

	def update
		@testeo = Testeo.find(params[:id])
		if @testeo.pasaje_id.nil?
			viaje = Pasaje.find(Invitado.find(@testeo.invitado_id).pasaje_id).viaje_id
		else
			viaje = Pasaje.find(@testeo.pasaje_id).viaje_id
		end
		if @testeo.update(testeo_params)
			redirect_to pasajeros_vistachofer_index_path(:id=> viaje), notice: "Se actualizo el testeo correctamente"
		else
			render :edit
		end
	end

	def destroy
		@testeo = Testeo.find(params[:id])
		if @testeo.pasaje_id.nil?
			viaje = Pasaje.find(Invitado.find(@testeo.invitado_id).pasaje_id).viaje_id
		else
			viaje = Pasaje.find(@testeo.pasaje_id).viaje_id
		end
		@testeo.destroy
		redirect_to pasajeros_vistachofer_index_path(:id=> viaje), notice: "El testeo se elimino correctamente"		
	end

	private
	def testeo_params
		params.require(:testeo).permit(:temperatura, :pregunta1, :pregunta2, :pregunta3)		
	end
end
