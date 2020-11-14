class Viaje < ApplicationRecord
	validates :combi, uniqueness: { scope: :fecha, scope: :hora }
end
