class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
  end

  def new
  end
end
