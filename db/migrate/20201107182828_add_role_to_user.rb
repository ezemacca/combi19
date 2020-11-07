class AddRoleToUser < ActiveRecord::Migration[6.0]
  def change
  	add_column :usuarios, :role, :string, :default => "usuario"
  end
end
