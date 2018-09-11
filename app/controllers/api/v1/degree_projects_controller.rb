class Api::V1::DegreeProjectsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_degree_project, only: [:show, :update, :destroy]
  #Funcion que muesta todos los proyectos de grado
  def index
    @degree_projects = DegreeProject.all
    json_response(@degree_projects)
  end

  #Funcion que crea un proyecto degrado
  def create
    @degree_projects = DegreeProject.create!(degree_projects_params)
    json_response(@degree_projects, :created)
  end

  #Funcion que actualiza un proyecto de grado
  def update
    @career.update(degree_projects_params)
    head :no_content
  end

  #Funcion que muestra un proyecto de grado
  def show
    json_response(@degree_projects)
  end

  #Funcion que elimina unproyecto de grado
  def destroy
    if @degree_projects.destroy!
      render json: {"status" => "exito", "message" => "El proyecto de grado fue eliminado"}
    else
      render json: {"status" => "error", "message" => @degree_projects.errors}
    end
  end

  private

  #Funcion que define los parametros aceptados por un proyecto de grado
  def degree_projects_params
    params.permit(:title, :description, :start_date, :finish_date, :date_exposition, :score, :modalities_id, :project_states_id)
  end

  #Funcion que setea una proyecto de grado especifico
  def set_degree_project
    @degree_projects = DegreeProject.find(params[:id], params[:modalities_id], params[:project_states_id])
  end
end
