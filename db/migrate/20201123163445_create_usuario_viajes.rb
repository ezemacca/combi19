class CreateUsuarioViajes < ActiveRecord::Migration[6.0]
  def change
    create_table :usuario_viajes do |t|
    	t.belongs_to :usuario
    	t.belongs_to :viaje
      t.timestamps
    end
  end
end
