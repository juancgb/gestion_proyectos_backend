class Api::V1::ModalitiesController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_modality, only: [:show, :update, :destroy]
  #Funcion que muesta todas las modalidades
  def index
    @modalities = Modality.all
    json_response(@modalities)
  end

  #Funcion que crea una modalidad
  def create
    @modalities = Modality.create!(modality_params)
    json_response(@modalities, :created)
  end

  #Funcion que actualiza una modalidad
  def update
    @modality.update(modality_params)
    head :no_content
  end

  #Funcion que muestra una modalidad
  def show
    json_response(@modality)
  end

  #Funcion que elimina una modalidad
  def destroy
    if @modality.destroy!
      render json: {"status" => "exito", "message" => "La modalidad fue eliminada"}
    else
      render json: {"status" => "error", "message" => @modality.errors}
    end
  end

  private

  #Funcion que define los parametros aceptados por una modalidad
  def modality_params
    params.permit(:name, :resolution, :is_active, :office_careers_id)
  end

  #Funcion que setea una modalidad especifica
  def set_modality
    @modality = Modality.find(params[:id])
  end
end
