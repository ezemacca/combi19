class ArreglandoInvitados < ActiveRecord::Migration[6.0]
  def change
  	remove_column :invitados, :integer
  	change_column :invitados, :DNI, :integer
  end
end
