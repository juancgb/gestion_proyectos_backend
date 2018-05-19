class Api::V1::ProcessLevelsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_process_level, only: [:show, :update, :destroy]
    #Funcion que muesta todos los niveles
    def index
        @process_levels = ProcessLevel.all
        json_response(@process_levels)
    end
    #Funcion que crea un nivel
    def create
        @process_levels = ProcessLevel.create!(process_level_params)
        json_response(@process_levels, :created)
    end
    #Funcion que actualiza un nivel
    def update
        @process_level.update(process_level_params)
        head :no_content
    end
    #Funcion que muestra un nivel
    def show
        json_response(@process_level)
    end
    #Funcion que elimina un nivel
    def destroy
        @process_level.destroy
        head :no_content
    end
    #Funcion que muesta todos los niveles de un proceso
    def find_by_process
        @process_levels = ProcessLevel.where(project_process_id: "#{params[:project_process_id]}")
        json_response(@process_levels)
    end
    private
    #Funcion que define los parametros aceptados por un nivel
    def process_level_params
        params.permit(:project_process_id, :process_level_status_id, :mandatory, :request, :name, :description)
    end
    #Funcion que setea un nivel especifico
    def set_process_level
        @process_level = ProcessLevel.find(params[:id])
    end
end
