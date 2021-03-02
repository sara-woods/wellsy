class SessionsController < ApplicationController

  def my_bookings 
    @my_bookings = current_user.bookings
  end
end
