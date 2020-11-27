class CambiarNombreViajeid < ActiveRecord::Migration[6.0]
  def change
  	rename_column :calificacions, :viajes_id, :viaje_id
  end
end
