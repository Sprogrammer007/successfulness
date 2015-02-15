class Course < ActiveRecord::Base

  has_many :sections, dependent: :destroy
  belongs_to :user


  def self.course_types
    [
      'eBook',
      'Video Tutorial',
      'Seminar',
      'Webinar',
      'Single Module',
      'Multi Modules'
    ]
  end
end
