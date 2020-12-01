class PasajeTieneUnaCalificacion < ActiveRecord::Migration[6.0]
  def change
  	remove_column :calificacions, :pasaje
  	add_reference :pasajes, :calificacion
  end
end
