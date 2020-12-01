class AgregarPasajeidInvitados < ActiveRecord::Migration[6.0]
  def change
  	add_column :invitados, :pasaje_id, :integer
  end
end
