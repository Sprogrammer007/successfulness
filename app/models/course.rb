class Course < ActiveRecord::Base

  has_many :sections, dependent: :destroy
  belongs_to :user

  PaymentMethods = ['None', 'One Time', 'Monthly', 'Annually']
  Discount = ['None', '10%', '20%', '30%', '40%', '50%']
  CourseType =  [
      'eBook',
      'Video Tutorial',
      'Seminar',
      'Webinar',
      'Single Module',
      'Multi Modules'
    ]
  attr_accessor :start_time, :end_time

  def self.course_types
   
  end
end
