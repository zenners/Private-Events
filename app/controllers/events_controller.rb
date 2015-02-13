class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  	@upcoming = Event.upcoming
    @past     = Event.past
  end

  def new
  	@event = current_user.events.build
  end

  def show
  	event
  end

  def create
  	@event = current_user.events.build(event_params)
  	if @event.save
  		redirect_to '/', notice: 'Successfully created event'
  	else
  		render 'new'
  	end

  end

  private

  def event_params
  	params.require(:event).permit(:title, :location, :description, :date)
  end

  def events
  	@events = Event.all
  end

  def event
  	@event = Event.find(params[:id])
  end
end
