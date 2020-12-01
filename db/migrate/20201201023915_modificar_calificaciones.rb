class ModificarCalificaciones < ActiveRecord::Migration[6.0]
  def change
  	remove_column :calificacions, :usuario_id
  	remove_column :calificacions, :viaje_id
  	add_reference :calificacions, :pasaje
  end
end
