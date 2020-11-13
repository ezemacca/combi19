class AgregarColumnaEliminado < ActiveRecord::Migration[6.0]
  def change
  	add_column :combis, :eliminado, :boolean, :default => false
  	add_column :lugars, :eliminado, :boolean, :default => false
  	add_column :ruta, :eliminado, :boolean, :default => false
  	add_column :usuarios, :eliminado, :boolean, :default => false
  end
end
