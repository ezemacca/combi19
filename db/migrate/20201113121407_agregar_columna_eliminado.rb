class AgregarColumnaEliminado < ActiveRecord::Migration[6.0]
  def change
  	add_column :combis, :eliminado, :boolean
  	add_column :lugars, :eliminado, :boolean
  	add_column :ruta, :eliminado, :boolean
  	add_column :usuarios, :eliminado, :boolean
  end
end
