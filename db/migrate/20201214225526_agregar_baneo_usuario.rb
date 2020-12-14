class AgregarBaneoUsuario < ActiveRecord::Migration[6.0]
  def change
  	add_column :usuarios, :baneo, :date
  end
end
