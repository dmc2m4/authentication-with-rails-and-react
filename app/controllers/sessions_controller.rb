class SessionsController < ApplicationController

include CurrentUserConcern

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
        reset_session
        reder json: {status: 200, logged_out: true}
    end

    def logged_in
        if @current_user
            render json: {
                logged_in: true,
                user: @ current_user
            }
        else
            render json: {
                logged_in: false,
            }
        end
    end

end
