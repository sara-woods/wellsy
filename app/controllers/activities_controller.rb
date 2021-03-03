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
end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :category_id )
  end
