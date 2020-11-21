class CambiarAtributoTarjetaUsuario < ActiveRecord::Migration[6.0]
  def change
  	change_column :usuarios, :vencimiento, :datetime
  end
end
