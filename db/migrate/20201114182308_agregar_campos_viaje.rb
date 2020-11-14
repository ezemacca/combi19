class AgregarCamposViaje < ActiveRecord::Migration[6.0]
  def change
  	add_column :viajes, :origen, :lugar
  	add_column :viajes, :destino, :lugar
  	add_column :viajes, :ruta, :ruta
  	add_column :viajes, :combi, :combi
  	add_column :viajes, :chofer, :usuario
  end
end
