class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@previous_events = @user.previous_events
    @upcoming_events = @user.upcoming_events
  end
end
