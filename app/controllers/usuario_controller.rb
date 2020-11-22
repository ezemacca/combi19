class UsuarioController < ApplicationController
  def show
  	@usuario=Usuario.find(current_usuario.id)

  end
  def viaje_comprado
  	#@viajecomprado= Viaje.find(1)
  end
  def index
  	@usuario=current_usuario.id
  end
  def edit
  	@usuario=Usuario.find(current_usuario.id)
  end
  
end
