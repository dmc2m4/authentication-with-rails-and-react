class RegistrationsController < ApplicationController

    def create 
        user = User.create!(
            email: params["email"],
            password: params['password'],
            password_confirmation: params['password_confirmation']
        )
        if user
            session[:user_id] = user
            render json: {
                status: :created,
                user: user
            }
        else 
            render json: {
                status: :unprocessable_entity
            }
        end
    end

end
