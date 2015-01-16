module ApplicationHelper

  # Helper Method for Page Title
  def page_title(title)
    base_title = "Successfulnes"
    if title.empty?
      base_title
    else
      "#{base_title} | #{title}"
    end
  end

  def current_user!
    current_user || current_admin
  end
end
