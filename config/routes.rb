Rails.application.routes.draw do

  get 'lugar/index'
  get 'ruta/alta'
  post 'ruta' => "ruta#create"


  get 'lugar/new'							    # Creacion de los lugares
  post 'lugar' => "lugar#create"	# Creacion de los lugares  
  get 'choferes/index'
  get 'usuario/index'
  get 'administrador/index'
  get 'welcome/index'
  get 'combis/new'
  get 'combis/index'
  post 'combis' => "combis#create"
  devise_for :usuarios

  root 'welcome#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
