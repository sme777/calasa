class UsersController < ApplicationController
    def index
        @execs = User.all.select {|user| !user.role.nil?}
    end

    def profile
        @current_user = User.find_by(id: session[:user_id])
    end

    def register
        
    end

    def update
        user = User.find_by(id: params[:id])
        user.update(major: params[:major], year: params[:year])
        if params[:image] != ""
            user.image.attach(params[:image])
        end
        redirect_to '/profile'
    end

    def delete
        user = User.find_by(id: params[:id])
        user.delete
        session[:user_id] = nil
        redirect_to '/'
    end

    def resign
        user = User.find_by(id: params[:id])
        user.update(role: nil)
        redirect_to '/profile'
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            # user.image.attach('')
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
