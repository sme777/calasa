class SessionsController < ApplicationController
    def signin
        
    end

    def create
        user = User.find_by(email:login_params[:email])
        if user && user.authenticate(login_params[:password])
            session[:user_id] = user.id
            redirect_to '/'
        else
            flash[:danger] = "Invalid Credentials."
            redirect_to '/signin'
        end
    end

    def signout
        session[:user_id] = nil
        redirect_to '/'

    end
    

    private
        def login_params
            params.require(:login).permit(:email, :password)
        end


end
