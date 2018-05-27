class Api::V1::ProcessLevelStatusesController < ApplicationController
    #before_action :authenticate_user!
    before_action :set_process_level_status, only: [:show, :update, :destroy]
    #Funcion que muesta todos los carreras
    def index
        @process_level_statuses = ProcessLevelStatus.all
        json_response(@process_level_statuses)
    end
    #Funcion que crea un estado de un Nivel 
    def create
        @process_level_statuses = ProcessLevelStatus.create!(process_level_status_params)
        json_response(@process_level_statuses, :created)
    end
    #Funcion que actualiza un estado de un Nivel 
    def update
        @process_level_status.update(process_level_status_params)
        head :no_content
    end
    #Funcion que muestra un estado de un Nivel 
    def show
        json_response(@process_level_status)
    end
    #Funcion que elimina un estado de un Nivel 
    def destroy
        if @process_level_status.destroy!
        render json: {'status' => 'exito', 'message' => "El estado fue eliminado"}
        else
        render json: {'status' => 'error', 'message' => @process_level_status.errors}
        end
    end

    private
    #Funcion que define los parametros aceptados por un estado de un Nivel 
    def process_level_status_params
        params.permit(:name)
    end
    #Funcion que setea un estado de un Nivel especifico
    def set_process_level_status
        @process_level_status = ProcessLevelStatus.find(params[:id])
    end
end
