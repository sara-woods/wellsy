class SessionsController < ApplicationController


  def my_bookings 
    @my_bookings = current_user.bookings
  end


  def index
    @sessions = Session.all
  end


end
