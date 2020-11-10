class CombisController < ApplicationController
	def index

	end

	def new
		@combi = Combi.new
	end

	def create
		@combi=Combi.new(params.require(:combi).permit(:clasificacion,:plazas_totales,:modelo,:patente))
		if @combi.save
    		redirect_to administrador_index_path, notice: "se cargo la combi correctamente"
    	else
    		redirect_to administrador_index_path, notice: "No se cargo la combi, combi repetida"
    	end
	end
end
