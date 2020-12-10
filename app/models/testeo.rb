class Testeo < ApplicationRecord
	before_save :sospechoso

	def sospechoso
		if self.temperatura > 37
			self.sospechado = 1
		else
			if self.pregunta1 && self.pregunta2
				self.sospechado = 1
			else
				if self.pregunta3 && self.pregunta1
					self.sospechado = 1
				else
					if self.pregunta3 && self.pregunta2
						self.sospechado = 1
					else
						self.sospechado = 0
					end
				end
			end			
		end		
	end
end
