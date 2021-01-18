class EventsController < ApplicationController
    before_action :authenticate, :except => [ :index ]
    def index
        @events = Event.order("created_at DESC").all
    end

    def new
        @event = Event.new
    end

    def edit
        @event = Event.find(params[:id])
    end

    def show
        @event = Event.find(params[:id])
        render :show
    end

    def create
        @event = Event.new(event_params)
        @event.image.attach(params[:event][:image])

        if @event.save
            redirect_to '/events'
        else
            render :new
        end
    end

    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
            if params[:event][:image] != nil
                @event.image.attach(params[:event][:image])
            end
            redirect_to @event
        else
            render :edit
        end
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to '/events'
    end


    def authenticate
        redirect_to '/events' unless session[:user_id] != nil
    end


    private
    def event_params
        params.require(:event).permit(:title, :content, :rsvp, :share, :image)
    end

end