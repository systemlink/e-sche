class EventsController < ApplicationController
  before_action :set_event, only: [:show]
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_request)
    
    if @event.save
      redirect_to event_url(@event)
    else
      render :new
    end
  end
  
  def show
  end
  
  private

    def event_request
      params.require(:event).permit(:title, :note)
    end
  
    def set_event
      @event = Event.find(params[:id])
    end
end
