class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @sessions = Session
  end

end
