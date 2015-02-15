class Section < ActiveRecord::Base
  belongs_to :user
  belongs_to :page_template
end
