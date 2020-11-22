class Ponerdefaultproductosnulos < ActiveRecord::Migration[6.0]
  def change
  	change_column :productos, :eliminado, :boolean, :default => false
  end
end
