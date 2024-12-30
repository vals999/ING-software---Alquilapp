class UsersController < ApplicationController
  add_flash_types :danger,:warning, :notice

    def index
      @users = User.all
    end
      
    def new
      @user = User.new
    end

    def show
      @userU=User.find(params[:id])
    end

    def home
       if current_user 
          if current_user.role == "administrador"
            redirect_to user_admin_path
          end
          if current_user.role == "usuario"
            redirect_to user_usuario_path
          end
          if current_user.role == "supervisor"
            redirect_to user_supervisor_path
          end
       end
    end

    def actualizarLicencia
      if current_user
        if current_user.role = "usuario"
          @userU=User.find(current_user.id)
          @userU.licencia_rechazada=false #si cambio la fecha de vencimiento vuelve a la lista de verificar licencia
          @userU.save
        end
      end
    end
    
    def userAdmin_listAdmin
      @admin= User.where(role: "administrador")
    end

    def userAdmin_listaSupervisor
      @supervisores= User.where(role: "supervisor")
    end

    def userAdmin_editEmployees
      @supervisor = User.find(params[:id])
    end

    def update_Employees
      @supervisor = User.find(params[:id])
      if @supervisor.update(supervisor_params)
        if(@supervisor.role=="usuario")
          redirect_to mercadopago_index_path
        else
          redirect_to user_admin_lista_path , notice: "Se ha editado el supervisor con exito"
        end
      else
        redirect_to user_admin_editEmployees_path, danger: "Ha ocurrido un error al agregar supervisor, revise que los campos no esten vacios o repetidos"
      end
    end

    def deleteSup
      @supervisor= User.find(params[:id])
      if @supervisor.reclamo
        redirect_to user_admin_lista_path, danger: "No se puede eliminar supervisor porque tiene un reclamo activo"
      else
       @supervisor.destroy
       redirect_to user_admin_lista_path, notice: "El supervisor se ha eliminado correctamente"
      end
    end

    def userUsuario
      @usuario=current_user
    end

    def userSupervisor
      @supervisor=current_user
    end

    def userAdmin
      @admin=current_user
    end

    def listaLicencias
      @usuarios= User.where(role: "usuario", hayLicencia: false, licencia_rechazada: false)
    end
    
    def validarLic
      @usuario= User.find(params[:id])
      @usuario.hayLicencia=true
      if @usuario.save
        redirect_to listar_licencias_path,notice: "La licencia se ha validado correctamente"
      else
        redirect_to listar_licencias_path, danger: "Hubo un error al validar la licenca, reintente por favor"
      end   
    end
     
    def rechazarLic
      @usuario= User.find(params[:id])
      @usuario.licencia_rechazada=true
      if @usuario.save
        redirect_to listar_licencias_path,notice: "La licencia se ha rechazado correctamente"
      else
        redirect_to listar_licencias_path, danger: "Hubo un error al rechazar la licenca, reintente por favor"
      end
    end

    def elegirSaldo
      @us=User.find(current_user.id)
    end
    
  

    private
    def supervisor_params
      params.require(:user).permit(:email, :name, :last_name, :dni_nro,:license,:vencimiento_licencia, :horas, :saldo)
    end
    def user_params
      params.require(:user).permit(:horas,:saldo)
    end

    

end 