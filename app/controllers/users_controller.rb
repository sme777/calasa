class UsersController < ApplicationController
    def index

    end

    def register
        
    end

    def create

        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to '/'
        else
            flash[:register_errors] = user.errors.full_messages 
            redirect_to '/register'
        end
    end


    def is_logged?
        session[:user_id] != nil
    end

    def is_not_logged?
        session[:user_id] == nil
    end


    private
        def user_params
            params.require(:user).permit(:name, :email, :password)
        end

end
