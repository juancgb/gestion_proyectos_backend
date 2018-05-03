class Api::V1::RolesController < ApplicationController
  /before_action :authenticate_user!/
  before_action :set_role, only: [:show, :update, :destroy]
  #Funcion que muesta todos los roles
  def index
    @roles = Role.all
    json_response(@roles)
  end
  #Funcion que crea un rol
  def create
    @roles = Role.create!(role_params)
    json_response(@roles, :created)
  end
  #Funcion que actualiza un rol
  def update
    @role.update(role_params)
    head :no_content
  end
  #Funcion que muestra un rol
  def show
    json_response(@role)
  end
  #Funcion que elimina un rol
  def destroy
    if @role.destroy!
      render json: {'status' => 'exito', 'message' => "El rol fue eliminado"}
    else
      render json: {'status' => 'error', 'message' => @role.errors}
    end
  end

  private
  #Funcion que define los parametros aceptados por un rol
  def role_params
    params.permit(:name, :description, :status)
  end
  #Funcion que setea un rol especifica
  def set_role
    @role = Role.find(params[:id])
    @role.inspect
  end
end
