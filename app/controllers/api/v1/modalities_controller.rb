class Api::V1::ModalitiesController < ApplicationController
    #before_action :authenticate_user!
    before_action :set_modality, only: [:show, :update, :destroy]
    #Funcion que muesta todos los modalities
    def index
      @modalities = Modality.all
      json_response(@modalities)
    end
    #Funcion que crea una modalidad
    def create
      @modalities = Modality.create!(modality_params)
      json_response(@modalities, :created)
    end
    #Funcion que actualiza un rol
    def update
      @modality.update(modality_params)
      head :no_content
    end
    #Funcion que muestra un rol
    def show
      json_response(@modality)
    end
    #Funcion que elimina un rol
    def destroy
      if @modality.destroy!
        render json: {'status' => 'exito', 'message' => "El rol fue eliminado"}
      else
        render json: {'status' => 'error', 'message' => @modality.errors}
      end
    end
  
    private
    #Funcion que define los parametros aceptados por un rol
    def modality_params
      params.permit(:name, :description, :status)
    end
    #Funcion que setea un rol especifica
    def set_modality
      @modality = Modality.find(params[:id])
    end
  end
  