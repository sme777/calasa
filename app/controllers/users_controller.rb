class UsersController < ApplicationController
    def index

    end

    def signin
        
    end

    def register
        
    end

    def create

        pass = passwords[:password]
        confirmation = passwords[:confirm_password]

        if pass == confirmation
            user = User.new(user_params)
            if user.save
                session[:user_id] = user.id
                redirect_to '/'
            else
                
            end
        else

        end


    end


    private
        def user_params
            params.require(:user).permit(:name, :email, :password)
        end

        def passwords
            params.require(:user).permit(:password, :confirm_password)
        end
end
