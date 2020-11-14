class AgregarAtributosUsuarios < ActiveRecord::Migration[6.0]
  def change
  	#Definimos los campos para los usuarios chofer y usuario
  	add_column :usuarios, :nombre, :string
  	add_column :usuarios, :apellido, :string
  	add_column :usuarios, :DNI, :integer
  	add_column :usuarios, :suscripcion, :boolean

  	#Datos de tarjeta de credito
  	add_column :usuarios, :nrotarjeta, :string 
  	add_column :usuarios, :vencimiento, :string 
  	add_column :usuarios, :codseguridad, :string

  	#Campo para chofer
  	add_column :usuarios, :telefono, :string

  end
end
