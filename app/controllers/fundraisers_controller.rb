class FundraisersController < ApplicationController
    before_action :authenticate, :except => [ :index ]
    def index
        @fundraisers = Fundraiser.order("created_at DESC").all
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
        @fundraiser = Fundraiser.find(params[:id])
    end

    def create
        
        @fundraiser = Fundraiser.new(fundraiser_params)
        
        @fundraiser.image.attach(params[:fundraiser][:image])
         
        #@fundraiser.attach(params[:fundraiser][:images])
        #byebug
        if @fundraiser.save
            redirect_to  '/fundraisers'#@fundraiser
        else
            render :new
        end
    end

    def update
        @fundraiser = Fundraiser.find(params[:id])
        if @fundraiser.update(fundraiser_params)
            redirect_to @fundraiser
        else
            render :edit
        end
    end

    def destroy
        @fundraiser = Fundraiser.find(params[:id])
        @fundraiser.destroy
        redirect_to '/fundraisers'
    end

    def authenticate
        redirect_to '/fundraisers' unless session[:user_id] != nil
    end

    private
    def fundraiser_params
        params.require(:fundraiser).permit(:title, :description, :donate, :share, :image)
    end

    def model_params
        params.require(:fundraiser).permit(:title, :description, :donate, :share)
    end


end
