class FundraisersController < ApplicationController
    before_action :authenticate, :except => [ :index ]
    def index
        @fundraisers = Fundraiser.order("created_at DESC").all
    end

    def show
        @fundraiser = Fundraiser.find(params[:id])
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
         
        if @fundraiser.save
            redirect_to  '/fundraisers'
        else
            render :new
        end
    end

    def update
        @fundraiser = Fundraiser.find(params[:id])
        if @fundraiser.update(fundraiser_params)
            if params[:fundraiser][:image] != nil
                @fundraiser.image.attach(params[:fundraiser][:image])
            end
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
