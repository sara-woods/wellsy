class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @sessions = @user.sessions.where("sessions.end_time >= ?", DateTime.now).order(start_time: :asc)

    @all_sessions = @user.sessions.order(start_time: :desc)    
    @number_of_reviews  = 0
    @all_sessions.each do |session|
      @number_of_reviews += session.reviews.count
    end
    
  end

end
