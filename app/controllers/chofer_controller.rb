class ChoferController < ApplicationController
  def index
    @chofer = Usuario.where(role: "chofer", eliminado: false)
  end

  def show
    @chofer = Usuario.find(params[:id])
  end
  
  def new
  	@chofer = Usuario.new
  end
  def create
  	@chofer = Usuario.new(chofer_params)
    @chofer.suscripcion = false
  	@chofer.role = "chofer"

  	if @chofer.save
  		redirect_to chofer_path(@chofer), notice: "Se registro el chofer correctamente"
  	else
      flash[:error] = "Hubo un error al cargar chofer"
      render :new
  		#redirect_to administrador_index_path, notice: "No se pudo registrar el chofer, el mail asignado ya existe"
  	end
  end

  def edit
    @chofer = Usuario.find(params[:id])
  end

 def update
  @chofer = Usuario.find(params[:id])
    if @chofer.update(chofer_params)
      redirect_to chofer_index_path, notice: "El chofer se actualizo correctamente"
    else
      redirect_to chofer_index_path,notice: "Error al actualizar el chofer, ya existe ese chofer"
    end
  end 
  def destroy
    @chofer = Usuario.find(params[:id])
    @chofer.eliminado = true            #Lo marcamos como eliminado para la baja logica
    @chofer.email =  "#{rand()}@eliminado"          #Eliminamos al chofer y le anulamos el mail para que no pueda volver a ingresar y no tenga problemas con futuras creaciones de choferes
    @chofer.save!
    redirect_to chofer_index_path, notice: "El chofer se elimino correctamente"
  end

private
  def chofer_params
    params.require(:usuario).permit([:email, :password, :password_confirmation, :nombre, :apellido, :DNI, :telefono])    
  end
end
