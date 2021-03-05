class ActivitiesController < ApplicationController

  def index
    @activities = Activity.where(user: current_user)
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    if @activity.save
      redirect_to activities_path
    else
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    if @activity.save
      redirect_to activities_path
    else
      render :edit
    end
  end





  def destroy
    @activity = Activity.find(params[:id])
    sum = 0
    @activity.sessions.each do |session|
      if !session.empty?
        sum += 1
      end
    end

    if sum == 0
      flash[:notice] = 'Activity was deleted'
      @activity.destroy
    else
      flash[:notice] = 'Can\'t delete activity when sessions have been booked'
    end
    redirect_to activities_path
  end


  private

  def activity_params
    params.require(:activity).permit(:name, :description, :category_id)
  end

end
