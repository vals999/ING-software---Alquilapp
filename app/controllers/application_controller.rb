class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :phone, :dni_nro, :dni, :license, :birthdate, :role,:vencimiento_licencia,:licencia_rechazada])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :phone, :dni_nro, :dni, :license, :birthdate, :role,:vencimiento_licencia,:licencia_rechazada])
    end
end
