class BorrarIndex < ActiveRecord::Migration[6.0]
  def change
  	remove_index :calificacions, name: "index_calificacions_on_usuario_id"
  	remove_index :calificacions, name: "index_calificacions_on_viajes_id"
  end
end
