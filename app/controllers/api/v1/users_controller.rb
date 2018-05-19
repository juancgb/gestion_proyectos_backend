class Api::V1::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_params, only: [:assign_role]
    before_action :find_role, only: [:assign_role]

    def assign_role

        if @existing_role.blank?
            @user_role = UserRole.create!(set_params)
            json_response(@user_role, :created)
        else
            render json: {'status' => 'error', 'message' => "El usuario ya tiene un rol asignado para esta sede"}
        end
    end

    private

    def set_params
        params.permit(:role_id, :user_id, :office_id, :status)
    end

    def find_role
        @existing_role = UserRole.where('user_roles.user_id = ? AND user_roles.office_id = ?', params[:user_id], params[:office_id])
    end
end
