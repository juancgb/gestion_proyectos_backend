class Api::V1::ProjectProcessesController < ApplicationController
    #before_action :authenticate_user!
    before_action :office_index, only: [:find_by_office]
    before_action :career_index, only: [:find_by_career]
    before_action :office_career_index, only: [:find_by_office_career]
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
    #Funcion que busca procesos por oficina
    def find_by_office
        @project_processes = ProjectProcess.find_by_office("#{params[:office_id]}")
        json_response(@project_processes)
    end
    #Funcion que busca procesos por carrera
    def find_by_career
        @project_processes = ProjectProcess.find_by_career("#{params[:career_id]}")
        json_response(@project_processes)
    end
    #Funcion que busca procesos por carrera
    def find_by_office_career
        @project_processes = ProjectProcess.find_by_office_career("#{params[:office_id]}", "#{params[:career_id]}")
        json_response(@project_processes)
    end
    private
    #Funcion que define los parametros aceptados por un proceso
    def project_process_params
        params.permit(:office_id, :name, :career_id, :levels_number, :status )
    end
    def office_index
        params.permit(:office_id)
    end
    def career_index
        params.permit(:career_id)
    end
    def office_career_index
        params.permit(:office_id, :career_id)
    end
    #Funcion que setea un proceso especifico
    def set_project_process
        @project_process = ProjectProcess.find(params[:id])
    end
end
