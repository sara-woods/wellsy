class SessionsController < ApplicationController


  def my_bookings
    @my_upcoming_bookings = current_user.bookings.joins(:session).where("sessions.end_time >= ?", DateTime.now).order(start_time: :asc)
    @my_past_bookings = current_user.bookings.joins(:session).where("sessions.end_time < ?", DateTime.now).order(start_time: :desc)
  end

  def index
  #   @sessions = Session.where("sessions.end_time >= ?", DateTime.now).order(start_time: :asc)
      @sessions = Session.all
  end

  def new
    @session = Session.new
    @activity = Activity.find(params[:activity_id])
  end

  def create
    @session = Session.new(session_params)
    @activity = Activity.find(params[:activity_id])
    @session.activity = @activity

    if @session.save
      redirect_to activities_path(@session)
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:min_participants, :max_participants, :price, :start_time, :end_time)
  end

end
