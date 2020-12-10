class AgregarRelacionesATesteo < ActiveRecord::Migration[6.0]
  def change
  	add_column :testeos, :pasaje_id, :integer
  	add_column :testeos, :invitado_id, :integer
  end
end
