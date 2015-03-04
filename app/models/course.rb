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
  attr_accessor :start_hour, :start_minute, :start_period,
   :end_hour, :end_minute, :end_period 


  has_attached_file :thumbnail, :default_url => "no-image.png"
  validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/
  

  def self.course_types
   
  end


end
