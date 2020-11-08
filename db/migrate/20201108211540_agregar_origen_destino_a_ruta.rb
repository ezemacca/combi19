class AgregarOrigenDestinoARuta < ActiveRecord::Migration[6.0]
  def change
  	add_column :ruta, :nombre, :string
  	add_column :ruta, :origen, :lugar
  	add_column :ruta, :destino, :lugar
  end
end
