class EventsController < ApplicationController
  before_action :current_user_exists, only: [:new, :create]

  def index
    @upcoming_events = Event.upcoming_events
    @prev_events = Event.previous_events
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def new
  end

  def create
    current_user
    @event = @current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  private

    def event_params
      params.require(:event).permit(:location, :date)
    end
end
