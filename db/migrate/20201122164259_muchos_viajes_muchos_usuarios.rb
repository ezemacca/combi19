class MuchosViajesMuchosUsuarios < ActiveRecord::Migration[6.0]
  def change
	    create_table :viajes_usuarios, id: false do |t|
	      t.belongs_to :viajes
	      t.belongs_to :usuarios
	  	end
	end
end
