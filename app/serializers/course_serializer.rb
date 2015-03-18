class CourseSerializer < ActiveModel::Serializer
  attributes :title, :thumbnail, :course_category_id, :description, :start_date, :end_date,
  :prerequisites, :max_student, :course_type, :price, :status,
  :payment_method, :discount, :start_date, :start_time, :end_date, :end_time, :url

  has_many :sections

  def url
    course_url(object, :only_path => true)
  end

  def start_time
    object.start_date.strftime("%H:%M %p")
  end

  def end_time
    object.end_date.strftime("%H:%M %p")
  end

  def attributes
    data = super
    data[:start_date] = data[:start_date].strftime("%b %d, %Y")
    data[:end_date] = data[:end_date].strftime("%b %d, %Y")
    data
  end
end
