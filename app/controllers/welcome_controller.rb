class WelcomeController < ApplicationController
  
  def index

	if usuario_signed_in?

		if current_usuario.role=="admin"
			redirect_to administrador_index_path
  		end
  		if current_usuario.role=="usuario"
  			redirect_to usuario_index_path
		end
	end
	end
end
