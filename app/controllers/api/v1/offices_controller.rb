class Api::V1::OfficesController < ApplicationController
    #before_action :authenticate_user!
    before_action :set_office, only: [:show, :update, :destroy]
    #Funcion que muesta todas las sedes
    def index
        @offices = Office.all
        json_response(@offices)
    end
    #Funcion que crea una sede
    def create
        @offices = Office.create!(office_params)
        json_response(@offices, :created)
    end
    #Funcion que actualiza una sede
    def update
        @office.update(office_params)
        head :no_content
    end
    #Funcion que muestra una sede
    def show
        json_response(@office)
    end
    #Funcion que elimina una sede
    def destroy
        @office.destroy
        head :no_content
    end

    private
    #Funcion que define los parametros aceptados por una sede
    def office_params
        params.permit(:name, :status)
    end
    #Funcion que setea una sede especifica
    def set_office
        @office = Office.find(params[:id])
    end
end
