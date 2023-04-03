class SessionsController < ApplicationController
    def  create
        user = User
                .find_by(email: params["email"])
                .try(:authenticate, params["password"])
        if user
            session[:user_id] = user
            render json: {
                status: :created,
                logged_in: true,
                user: user
            }
        else 
            render json: {status: 401}
        end
    end

    def logout
    end

    def logged_in
    end
    
end
