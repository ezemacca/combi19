class CombisController < ApplicationController
	def index

	end

	def new
		@combi = Combi.new
	end
	def edit
		@combi= Combi.find(params[:id])
	end

	def create
		@combi=Combi.new(params.require(:combi).permit(:clasificacion,:plazas_totales,:modelo,:patente))
		if @combi.save
    		redirect_to administrador_index_path, notice: "se cargo la combi correctamente"
    	else
    		c=Combi.find_by(patente: @combi.patente)
    		if !c.nil?
    			if c.eliminado
    			
    				c.eliminado=false
    				c.save
    				redirect_to administrador_index_path, notice: "Se cargo la combi correctamente (2)"
    			else
    				redirect_to administrador_index_path, notice: "No se cargo la combi, combi repetida"
    			end
    		end
    		
    	end
	end
	#	@combiselected= Combi.where(patente: params[:id] ))
	def update
		@combi= Combi.find(params[:id])

		if @combi.update(combi_params)
			redirect_to combis_path, notice: "Se actualizo correctamente"
		else
			redirect_to combis_path, notice: "Error al actualizar"
		end
	end

	def destroy
		@combi= Combi.find(params[:id])
		@combi.eliminado=true
		@combi.save
		redirect_to combis_path, notice: "Se elimino correctamente"

	end

	private
		def combi_params
			params.require(:combi).permit(:clasificacion,:plazas_totales,:modelo,:patente)
		end
end

