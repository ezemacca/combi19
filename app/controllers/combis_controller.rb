class CombisController < ApplicationController
	def index

	end

	def new
		#@combi = Combi.new
	end

	def create
		@combi=Combi.new(params.require(:combi)).permit(:clasificacion,:plazas_totales,:plazas_libres,:modelo,:patente)
		@combi.save
    	redirect_to administrador_index_path
	end
end
