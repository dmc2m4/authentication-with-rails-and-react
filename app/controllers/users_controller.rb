class UsersController < ApplicationController

    before_action :set_user, only: [:show, :destroy, :edit]

    def index 
        @user = User.all
        render json: @user, status: :ok
    end

    def show
        render json: @user, status: :ok
    end

    def destroy
        @user.destroy
        render json: {
            status: :deleted
        }
    end

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :img, :password, :name)
    end
end
