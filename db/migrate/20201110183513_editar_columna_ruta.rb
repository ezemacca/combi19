class EditarColumnaRuta < ActiveRecord::Migration[6.0]
  def change
  	change_column :ruta, :origen, :integer
  	change_column :ruta, :destino, :integer
  end
end
