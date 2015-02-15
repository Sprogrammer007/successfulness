class CoursesController < ApplicationController
  layout 'app_ember'

  before_filter :authenticate_teacher!

  def index
    @courses = current_user.courses
  end

  def new
    @course = Course.new()
  end

  def create
    Rails.logger.warn "#{params}"
    redirect_to :back
  end
end
