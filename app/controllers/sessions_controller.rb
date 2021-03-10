class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def my_bookings
    @my_upcoming_bookings = current_user.bookings.joins(:session).where("sessions.end_time >= ?", DateTime.now).order(start_time: :asc)
    @my_past_bookings = current_user.bookings.joins(:session).where("sessions.end_time < ?", DateTime.now).order(start_time: :desc)
  end

  def index
    # Remember to change this back to only future ssessions showing on index instead of all
    @sessions = Session.where("sessions.end_time >= ?", DateTime.now).order(start_time: :asc)
    # @sessions = Session.all

    if params[:session] && params[:session] != ""
      activities = Activity.where("name ILIKE :query OR description ILIKE :query", query: "%#{params[:session]}%")
      @sessions = Session.where(activity_id: activities.ids)
    end
    if params.dig(:filters, :category).present? && params.dig(:filters, :category) != 0
      @sessions = @sessions.select { |session| session.category == Category.find(params[:filters][:category].to_i)}
    end
    if params.dig(:filters, :price).present? && params.dig(:filters, :price) != 0
      # @sessions = @sessions.select { |session| session.price == Category.find(params[:filters][:category].to_i)}
    end
    if params.dig(:filters, :day).present? && params.dig(:filters, :day) != 0
      @sessions = @sessions.select { |session| session.start_time.strftime("%A") == params[:filters][:day] }
    end
  end


  def new
    @session = Session.new
    @activity = Activity.find(params[:activity_id])
  end



  def create
    @duration = params[:other][:duration].to_i
    @end_time = params[:session][:start_time].to_datetime + @duration.minutes
    @session = Session.new(max_participants: session_params[:max_participants], min_participants: session_params[:min_participants], price: session_params[:price], start_time: session_params[:start_time], end_time: @end_time)

    # @session = Session.new(session_params)
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
    params.require(:session).permit(:min_participants, :max_participants, :price, :start_time, :end_time, :duration)
  end

end
