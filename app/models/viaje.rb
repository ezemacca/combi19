class Viaje < ApplicationRecord

	def validacion_fecha
		viaje = Viaje.find_by(combi: self.combi, fecha: self.fecha)
		if !viaje.nil?
			return false
		else
			if self.fecha > Time.now
				return true
			else
				return false
			end
		end
	end

end
