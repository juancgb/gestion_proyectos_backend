class Api::V1::ProjectProcessesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project_process, only: [:show, :update, :destroy]
    #Funcion que muesta todos los procesos
    def index
        @project_processes = ProjectProcess.all
        json_response(@project_processes)
    end
    #Funcion que crea un proceso
    def create
        @project_processes = ProjectProcess.create!(project_process_params)
        json_response(@project_processes, :created)
    end
    #Funcion que actualiza un proceso
    def update
        @project_process.update(project_process_params)
        head :no_content
    end
    #Funcion que muestra un proceso
    def show
        json_response(@project_process)
    end
    #Funcion que elimina un proceso
    def destroy
        @project_process.destroy
        head :no_content
    end

    private
    #Funcion que define los parametros aceptados por un proceso
    def project_process_params
        params.permit(:office_id, :name, :career_id, :levels_number, :status )
    end
    #Funcion que setea un proceso especifico
    def set_project_process
        @project_process = ProjectProcess.find(params[:id])
    end
end
