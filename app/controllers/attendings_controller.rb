class AttendingsController < ApplicationController
  def create
  	@event = Event.find(params[:attending][:attended_event_id])
    current_user.attend!(@event)
    redirect_to @event
  end

  def destroy
  	@event = Attending.find(params[:id]).attended_event
  	current_user.cancel!(@event)
  	redirect_to @event
  end


end
