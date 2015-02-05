class User < ActiveRecord::Base

  attr_accessor :login

  serialize :profile

  has_attached_file :display_image, :default_url => "no-image.png"
  
  validates :username, presence: true, format: { with: /\A[a-zA-Z0-9]+\Z/ },
    uniqueness: { case_sensitive: false }

  has_secure_password
  
  # Overwrite to_params
  def to_param
    username
  end
end
