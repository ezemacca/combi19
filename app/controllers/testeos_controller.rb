class TesteosController < ApplicationController

	def show
		@testeo = Testeo.find(params[:id])		
	end

	def new
		@testeo = Testeo.new
		if params[:pasaje]
			@pasaje= params[:pasaje]
		else
			@invitado=params[:invitado]
		end

	end

	def create
		@testeo = Testeo.new(testeo_params)
		
		
		#asignar pasaje
		if @testeo.save
			redirect_to @testeo, notice: "Se guardo el testeo correctamente"
		else
			render :new
		end
	end

	def edit
		@testeo = Testeo.find(params[:id])		
	end

	def update
		@testeo = Testeo.find(params[:id])
		if @testeo.update(testeo_params)
			redirect_to @testeo, notice: "Se actualizo el testeo correctamente"
		else
			render :edit
		end
	end

	def destroy
		@testeo = Testeo.find(params[:id])
		@testeo.destroy
		redirect_to new_testeo_path, notice: "El testeo se elimino correctamente"		
	end

	private
	def testeo_params
		params.require(:testeo).permit(:temperatura, :pregunta1, :pregunta2, :pregunta3)		
	end
end
