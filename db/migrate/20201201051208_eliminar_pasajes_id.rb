class EliminarPasajesId < ActiveRecord::Migration[6.0]
  def change
  	remove_column :pasajes, :calificacion_id
  	#elnombre de la migracion esta mal
  end
end
