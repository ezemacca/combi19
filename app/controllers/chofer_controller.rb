class ChoferController < ApplicationController
  def index
  end
  def new
  	@chofer = Usuario.new
  end

  def create
  	@chofer = Usuario.new(chofer_params)
    @chofer.suscripcion = false
  	@chofer.role = "chofer"
  	if @chofer.save!
  		redirect_to administrador_index_path, notice: "Se registro el chofer correctamente"
  	else

  		redirect_to administrador_index_path, notice: "No se pudo registrar el chofer"
  	end
  end
  def edit
  end

private
  def chofer_params
    params.require(:usuario).permit([:email, :password, :password_confirmation, :nombre, :apellido, :DNI, :telefono])    
  end
end
