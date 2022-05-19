class RolesController < ApplicationController

    before_action :authenticate

    def index
        @execs = User.all.select {|user| !user.role.nil?}
        @users = User.all
        @roles = Role.all
        @new_role = Role.new
    end

    def create
        if role_params[:title].size == 0
            flash[:warning] = "Please provide a proper title."
        else
            Role.create(role_params)
            flash[:success] = "Successfully added a new role."
        end
        redirect_to '/management'
    end

    def update
        user = User.find_by(name: user_params[:user])
        user.update(role: user_params[:role])
        flash[:success] = "Successfully added a new exec."
        redirect_to '/management'
    end

    def delete
        user = User.find_by(id: params[:id])
        user.update(role: nil)
        flash[:warning] = "Exec removed."
        redirect_to '/management'
    end

    def authenticate
        redirect_to '/' unless session[:user_id] != nil
    end

    def role_params
        params.permit(:title, :rank)
    end

    def user_params
        params.permit(:user, :role)
    end
end
