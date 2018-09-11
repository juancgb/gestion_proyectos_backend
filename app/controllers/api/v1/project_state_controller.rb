class Api::V1::ProjectStatesController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_office, only: [:show, :update, :destroy]
  #Funcion que muesta todas los estados de proyecto
  def index
    @project_states = ProjectState.all
    json_response(@project_states)
  end

  #Funcion que crea una sede
  def create
    @project_states = ProjectState.create!(project_state_params)
    json_response(@project_states, :created)
  end

  #Funcion que actualiza una sede
  def update
    @project_state.update(project_state_params)
    head :no_content
  end

  #Funcion que muestra una sede
  def show
    json_response(@project_state)
  end

  #Funcion que elimina una sede
  def destroy
    @project_state.destroy
    head :no_content
  end

  private

  #Funcion que define los parametros aceptados por una sede
  def project_state_params
    params.permit(:name)
  end

  #Funcion que setea una sede especifica
  def set_office
    @project_state = ProjectState.find(params[:id])
  end
end
