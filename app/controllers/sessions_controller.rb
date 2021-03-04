class SessionsController < ApplicationController


  def my_bookings
    @my_upcoming_bookings = current_user.bookings.joins(:session).where("sessions.end_time >= ?", DateTime.now).order(start_time: :asc)
    @my_past_bookings = current_user.bookings.joins(:session).where("sessions.end_time < ?", DateTime.now).order(start_time: :desc)
  end

  def index
    # @sessions = Session.where("sessions.end_time >= ?", DateTime.now).order(start_time: :asc)
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

  def edit
    @session = Session.find(params[:id])
    if @session.empty?
      @session = Session.find(params[:id])
    else
      flash[:notice] = 'Session cannot be edited when session has been booked'
      redirect_to activities_path
    end
  end

  def update
    @session = Session.find(params[:id])
    @session.update(session_params)
    if @session.save
      redirect_to activities_path
    else
      render :edit
    end
  end


  def destroy
    @session = Session.find(params[:id])
    
    if @session.empty?
      flash[:notice] = 'Session was deleted'
      @session.destroy
    else
      flash[:notice] = 'Can\'t delete session when session has been booked'
    end
    redirect_to activities_path
  end

  private

  def session_params
    params.require(:session).permit(:min_participants, :max_participants, :price, :start_time, :end_time)
  end

end
