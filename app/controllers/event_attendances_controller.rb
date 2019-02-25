class EventAttendancesController < ApplicationController
  def create
    @event = Event.find(attendance_params[:attended_event_id])
    unless @event.attendees.find_by_id(attendance_params[:attendee_id])
      EventAttendance.create!(attendance_params)
    end
    redirect_to @event
  end

  private

    def attendance_params
      params.require(:event_attendance).permit(:attendee_id, :attended_event_id)
    end
end
