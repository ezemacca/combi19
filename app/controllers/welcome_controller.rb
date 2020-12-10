class WelcomeController < ApplicationController
  
  def index

	if usuario_signed_in?

		if current_usuario.role=="admin"
			redirect_to administrador_index_path
  		end
  		if current_usuario.role=="usuario"
  			redirect_to usuario_index_path
		end
		if current_usuario.role=="chofer"
			redirect_to vistachofer_vistachofer_path
		end
		if current_usuario.role=="expres"
			redirect_to rolexpres_expres_path, notice: "Luego de completar tus datos pasaras a ser un usuario registrado"
		end
	end
  end
end