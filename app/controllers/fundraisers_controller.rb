class FundraisersController < ApplicationController
    #before_action :authenticate, :except => [ :index ]
    def index
        @fundraisers = Fundraiser.all
    end

    def show
        @fundraiser = Fundraiser.find(params[:id])
        #redirect_to '/fundraisers'
        render :show
    end

    def new
        @fundraiser = Fundraiser.new
    end

    def edit
    end

    def create
        
        @fundraiser = Fundraiser.new(model_params) 
        #byebug
        if @fundraiser.save
            redirect_to @fundraiser
        else
            render :new
        end
    end

    def update
        if @post.update(model_params)
            redirect_to @post, notice: "Fundraiser successfully updated."
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_url, notice: "Fundraiser successfully deleted."
    end

    def authenticate
        redirect_to '/fundraisers' unless session[:user_id] != nil
    end

    private
    def fundraiser_params
        params.require(:fundraiser).permit(:title, :description, images: [])
    end

    def model_params
        params.require(:fundraiser).permit(:title, :description)
    end


end
