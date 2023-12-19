class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, raise: false
    def index
        @users = User.all
    end
    def show
        @users = User.all
        render json: @users
    end
    def create
        @user_params = user_structure(params)
        @user = User.create(@user_params)
        if @user
            render json: @user, status: :ok
        else
            render json: { error: "Erreur dans la création de l'utilisateur" }, status: :not_found
        end
    end

    def user_structure(user_data)
        user_data.permit(:name,:email)
    end

end