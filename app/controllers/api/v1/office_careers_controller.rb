class Api::V1::OfficeCareersController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_office_career, only: [:show, :update, :destroy]
  #   before_action :office_index, only: [:find_career_by_office]
  before_action :office_career_params, only: [:find_career_by_office, :find_office_by_career]
  #Funcion que muestra todos los carreras por sede
  def find_career_by_office
    @office_careers = OfficeCareer.find_career_by_office(params[:office_id])
    json_response(@office_careers)
  end

  #Funcion que muestra todos las sedes que ofrecen una carrera
  def find_office_by_career
    @office_careers = OfficeCareer.find_office_by_career(params[:career_id])
    json_response(@office_careers)
  end

  #Funcion que crea una carrera en una sede
  def create
    @office_career = OfficeCareer.create!(office_career_params)
    json_response(@office_career, :created)
  end

  #Funcion que actualiza una carrera de una sede
  def update
    @office_career.update(office_career_params)
    head :no_content
  end

  #Funcion que elimina una carrera de una sede
  def destroy
    if @office_career.destroy!
      render json: {"status" => "exito", "message" => "La carrera fue eliminada de la sede."}
    else
      render json: {"status" => "error", "message" => @office_career.errors}
    end
  end

  private

  #Funcion que define los parametros aceptados por una carrera
  def office_career_params
    params.permit(:office_id, :career_id)
  end

  def office_index
    params.permit(:office_id)
  end

  #Funcion que setea una carrera especifica
  def set_office_career
    @office_career = OfficeCareer.find(params[:id])
  end
end
