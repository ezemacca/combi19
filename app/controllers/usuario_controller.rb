class UsuarioController < ApplicationController
  def show
  	@usuario=Usuario.find(current_usuario.id)

  end

  def index
  	@usuario=current_usuario.id
  end
  def edit
  	@usuario=Usuario.find(current_usuario.id)
  end
  
end
