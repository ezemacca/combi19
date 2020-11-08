Rails.application.routes.draw do

  get 'ruta/alta'


  get 'agregar_lugar/index'
  post 'agregar_lugar' => "agregar_lugar#create"

  get 'choferes/index'
  get 'usuario/index'
  get 'administrador/index'
  get 'welcome/index'
  devise_for :usuarios

  root 'welcome#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
