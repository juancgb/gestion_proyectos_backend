class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Response
  include ExceptionHandler
  prepend_before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    atributos_registro = [
      :email, 
      :password, 
      :password_confirmation, 
      :name, 
      :nickname, 
    ]
    devise_parameter_sanitizer.permit :sign_up, keys: atributos_registro
    devise_parameter_sanitizer.permit :account_update, keys: atributos_registro
end
end
