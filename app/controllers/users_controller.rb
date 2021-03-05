class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @sessions = @user.sessions.where("sessions.end_time >= ?", DateTime.now).order(start_time: :asc)
  end

end
