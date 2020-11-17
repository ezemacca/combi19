class Viaje < ApplicationRecord
	validate :validacion_rango_fecha

	def validacion_rango_fecha
		viajes = Viaje.where("fecha < ?", self.fecha_llegada)
		viajes2 = viajes.where("fecha_llegada > ?", self.fecha)
		viajes2.each do |v|
			if self.id != v.id
				errors.add(:combi, :fecha, message: "La combi tiene asignado un viaje en ese rango de fecha") if v.combi == self.combi
				errors.add(:chofer, :fecha, message: "El chofer tiene asignado un viaje en ese rango de fecha") if v.chofer == self.chofer
			end
		end
	end

	def validacion_fecha
		viaje = Viaje.find_by(combi: self.combi, fecha: self.fecha)
		if !viaje.nil?
			return 3   # return 3 (la validacion no se cumple, la combi ya tiene un viaje a esa hora)
		else
			if self.fecha > Time.now
				return 1  # return 1 (la validacion se cumple, se puede guardar el viaje)
			else
				return 2 # return 2 (la validacion no se cumple, la fecha ya paso)
			end
		end
	end

	def validacion_actualizar
		viaje = Viaje.find_by(combi: self.combi, fecha: self.fecha,chofer: self.chofer)
		if !viaje.nil?
			return 3   # return 3 (la validacion no se cumple, la combi ya tiene un viaje a esa hora)
		else
			if self.fecha > Time.now
				return 1  # return 1 (la validacion se cumple, se puede guardar el viaje)
			else
				return 2 # return 2 (la validacion no se cumple, la fecha ya paso)
			end
		end		
	end
end
