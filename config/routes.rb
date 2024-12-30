Rails.application.routes.draw do
  resources :user_temp_admins
  get 'mercadopago/index'
  get 'mercadopago/show'
  get 'mercadopago/new'
  get 'user_temp_sups/index'
  get 'user_temp_sups/show'
  get 'user_temp_sups/new',as:"new_user_temp_sup"
  resources :user_temp_sups
  #Rutas del admin
  resources :cars
  get "cars/pausar/:id", to: "cars#changeEnable",as:"cars_lista_id"
  patch "cars/pausar/:id", to: "cars#changeEnable",as:"cars_pausar"
  get "cars/activar/:id", to: "cars#changeEnable",as:"cars_lista_activar_id"
  patch "cars/activar/:id", to: "cars#changeEnable",as:"cars_activar"
  get "cars/delete/:id", to: "cars#destroy"
  delete "cars/delete/:id", to: "cars#destroy", as:"cars_delete"
  get "cars/deleteCar/:id", to: "cars#deleteCar"
  delete "cars/deleteCar/:id", to: "cars#deleteCar", as:"cars_deletecar"
  #Rutas del admin
  get "users/admin", to: "users#userAdmin", as: "user_admin"
  get "users/admin/newSup", to: "users#newSup", as: "user_admin_agregarSupervisor"
  post "users/admin", to: "users#create"
  get "users/admin/listaSupervisor", to: "users#userAdmin_listaSupervisor", as: "user_admin_lista"
  get "users/admin/listaAdministradores", to: "users#userAdmin_listAdmin", as: "user_admin_listaAdmin"
  get '/user/:id', to: 'users#show', as: 'user'
  get 'users/admin/listaSupervisor/:id/edit_employees', to: 'users#userAdmin_editEmployees', as: 'user_admin_editEmployees'
  patch 'user/:id', to: 'users#update_Employees'
  get "users/admin/listaSupervisor/:id", to: "users#deleteSup", as: "user_admin_lista_id"
  delete 'users/admin/listaSupervisor/:id', to: 'users#deleteSup', as: 'superv_delete'
  #Rutas del usuario
  get "users/usuario", to: "users#userUsuario", as: "user_usuario"
  get "users/usuario/actualizarLicencia", to: "users#actualizarLicencia", as: "user_usuario_actualizarLicencia"

  
  #Rutas del supervisor
  get "users/supervisor", to: "users#userSupervisor", as: "user_supervisor"
  resources :users, only: [:index]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "users#home"


  get 'users/supervisor/listaLicencias', to: 'users#listaLicencias', as: 'listar_licencias'

  get 'users/supervisor/confirm/:id', to: 'users#validarLic', as: 'validar_licencia_id'
  patch 'users/supervisor/confirm/:id', to: 'users#validarLic', as: 'validar_licencia'

  get 'users/supervisor/confirm/rechazar/:id', to: 'users#rechazarLic', as: 'rechazar_licencia_id'
  patch 'users/supervisor/confirm/rechazar/:id', to: 'users#rechazarLic', as: 'rechazar_licencia'


  get 'users/usuario/:id/elegirsaldo', to: 'users#elegirSaldo', as: 'elegir_saldo'


  get 'mercadopago/success', to: 'mercadopago#success'
  get 'mercadopago/pending', to: 'mercadopago#pending'
  get 'mercadopago/failure', to: 'mercadopago#failure'

end
