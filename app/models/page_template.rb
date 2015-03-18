class PageTemplate < ActiveRecord::Base
  

  has_attached_file :thumbnail, :default_url => "no-image.png"
  validates_attachment :thumbnail, :presence => true,
  :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def uri
    "page_templates/templates/#{name.downcase}"
  end

  def self.categories
    [
      'Ebook',
      'Video',
      'Other'
    ]
  end
end
