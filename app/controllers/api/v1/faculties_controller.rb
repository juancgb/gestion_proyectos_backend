class Api::V1::FactultiesController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_faculty, only: [:show, :update, :destroy]
  #Funcion que muesta todos los facultades
  def index
    @faculties = Faculty.all
    json_response(@faculties)
  end

  #Funcion que crea una facultad
  def create
    @faculties = Faculty.create!(faculty_params)
    json_response(@faculties, :created)
  end

  #Funcion que actualiza una facultad
  def update
    @faculty.update(faculty_params)
    head :no_content
  end

  #Funcion que muestra una facultad
  def show
    json_response(@faculty)
  end

  #Funcion que elimina una facultad
  def destroy
    if @faculty.destroy!
      render json: {"status" => "exito", "message" => "La facultad fue eliminada"}
    else
      render json: {"status" => "error", "message" => @faculty.errors}
    end
  end

  private

  #Funcion que define los parametros aceptados por una facultad
  def faculty_params
    params.permit(:name, :status)
  end

  #Funcion que setea una facultad especifica
  def set_faculty
    @faculty = Faculty.find(params[:id])
  end
end
