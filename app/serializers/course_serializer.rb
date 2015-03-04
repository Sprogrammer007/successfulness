class CourseSerializer < ActiveModel::Serializer
  attributes :title, :thumbnail, :course_category_id, :description, :start_date, :end_date,
  :prerequisites, :student_limit, :max_student, :course_type, :note, :price, 
  :charge_method, :discount, :start_date, :end_date, :url

  def url
    course_url(object, :only_path => true)
  end
end
