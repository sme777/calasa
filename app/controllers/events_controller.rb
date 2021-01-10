class EventsController < ApplicationController
    before_action :authenticate, :except => [ :index ]
    def index
        
    end

    def create
    
    end

    def edit

    end

    def new
        @event = Event.new
    end

    def authenticate
        redirect_to '/events' unless session[:user_id] != nil
    end


    private
    def event_params
        params.require(:event).permit(:title, :content, :image)
    end

end