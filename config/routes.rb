Rails.application.routes.draw do

  get 'ruta/alta'


  get 'agregar_lugar/index'							# Creacion de los lugares
  post 'agregar_lugar' => "agregar_lugar#create"	# Creacion de los lugares  
  get 'choferes/index'
  get 'usuario/index'
  get 'administrador/index'
  get 'welcome/index'
  get 'combis/new'
  get 'combis/index'
  post 'combis' => "combis#new"
  devise_for :usuarios

  root 'welcome#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
