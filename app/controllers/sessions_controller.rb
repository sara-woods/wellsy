class SessionsController < ApplicationController


  def my_bookings 
    @my_upcoming_bookings = current_user.bookings.joins(:session).where("sessions.end_time >= ?", DateTime.now).order(start_time: :asc)
    @my_past_bookings = current_user.bookings.joins(:session).where("sessions.end_time < ?", DateTime.now).order(start_time: :desc)
  end


  def index
    @sessions = Session.where("sessions.end_time >= ?", DateTime.now).order(start_time: :asc)
  end


end
