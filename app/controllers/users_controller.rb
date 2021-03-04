class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @sessions = @user.sessions
  end

end
