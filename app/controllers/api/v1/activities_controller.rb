class Api::V1::ActivitiesController < ApplicationController
    #before_action :authenticate_user!
    before_action :set_activity, only: [:show, :update, :destroy]
    #Funcion que muesta todas las actividades
    def index
        @activities = Activities.includes(:process_level, :project_process).all
        json_response(@activities)
    end
    #Funcion que crea una actividad
    def create
        @activities = Activities.create!(activity_params)
        json_response(@activities, :created)
    end
    #Funcion que actualiza una actividad
    def update
        @activity.update(activity_params)
        head :no_content
    end
    #Funcion que muestra una actividad
    def show
        json_response(@activity)
    end
    #Funcion que elimina una actividad
    def destroy
        @activity.destroy
        head :no_content
    end
    #Funcion que muesta todas las actividades de un nivel de un proceso
    def find_by_process_level
        @activities = Activities.where(process_level_id: "#{params[:process_level_id]}").includes(:process_level, :project_process)
        json_response(@activities)
    end

    private
    #Funcion que define los parametros aceptados por una actividad
    def activity_params
        params.permit(:process_level_id, :project_process_id, :name, :description, :start_date, :end_date)
    end
    #Funcion que setea una actividad especifica
    def set_activity
        @activity = Activities.find(params[:id]).includes(:process_level, :project_process)
    end
end
