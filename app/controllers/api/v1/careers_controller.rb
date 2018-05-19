class Api::V1::CareersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_career, only: [:show, :update, :destroy]
    #Funcion que muesta todos los carreras
    def index
        @careers = Career.all
        json_response(@careers)
    end
    #Funcion que crea una carrera
    def create
        @careers = Career.create!(career_params)
        json_response(@careers, :created)
    end
    #Funcion que actualiza una carrera
    def update
        @career.update(career_params)
        head :no_content
    end
    #Funcion que muestra una carrera
    def show
        json_response(@career)
    end
    #Funcion que elimina una carrera
    def destroy
        if @career.destroy!
        render json: {'status' => 'exito', 'message' => "La carrera fue eliminada"}
        else
        render json: {'status' => 'error', 'message' => @career.errors}
        end
    end

    private
    #Funcion que define los parametros aceptados por una carrera
    def career_params
        params.permit(:name, :status)
    end
    #Funcion que setea una carrera especifica
    def set_career
        @career = Career.find(params[:id])
    end
end
