class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @activities = Activity.all
  end

  def show
    @activities = Activity.find(params[:id])
  end

end
