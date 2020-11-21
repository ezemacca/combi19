class CambiarAtributoTarjetaUsuario2 < ActiveRecord::Migration[6.0]
  def change
  	remove_column :usuarios, :vencimiento
  	add_column :usuarios, :vencimientoMes, :integer
  	add_column :usuarios, :vencimientoAño, :integer
  end
end
