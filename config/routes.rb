Rails.application.routes.draw do

  resources :calificacions
  resources :viajes
  resources :productos
  get 'ruta/alta'
  get 'ruta/index'
  resources :ruta
# Maneja la vista de lugar
  resources :lugar
  resources :chofer
  get 'usuario/index'
  get 'administrador/index'
  get 'welcome/index'
  #get 'combis/new'
  #get 'combis/index'
  #get 'combis/buscar_combi'
  #get 'combis/edit'
  post 'combis' => "combis#create"
  resources :combis
  devise_for :usuarios
  get 'usuario/VerViajesUsuario'
  resources :usuario
  root 'welcome#index'
  get 'vistachofer/vistachofer'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
