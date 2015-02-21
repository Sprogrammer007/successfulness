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
    course = current_user.courses.create(safeParams)
    if course.save()
      # TODO after save stuff
      redirect_to courses_path()
    else
      redirect_to :back
    end
  end

  private

    def safeParams
      startDate = convertDateTime(params[:start_date], params[:start_hour], params[:start_minute], params[:start_period])
      endDate = convertDateTime(params[:end_date], params[:end_hour], params[:end_minute], params[:end_period]) 


      params.require(:course).permit(:title, :thumbnail, :course_category_id, :description, :start_date, :end_date,
        :prerequisites, :student_limit, :max_student, :course_type, :note, :price, 
        :charge_method, :discount).merge(start_date: startDate, end_date: endDate)
      
    end

    def convertDateTime(date, hour, minute, period)
      time = (period == "AM") ? hour : (hour.to_i + 12)
      date += " #{time}:#{minute}"
      newDate = Time.zone.parse(date)
    end
end
