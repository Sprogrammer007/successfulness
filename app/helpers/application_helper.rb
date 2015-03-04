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

  # Helper to render Serialized data inline
  def json_for(obj, options = {})
    options[:scope] ||= self
    options[:url_options] ||= url_options
    ActiveModel::Serializer.serializer_for(obj).new(obj, options).to_json
  end


  def user_signed_in?
    !!current_user
  end

  def hours
    (1..12).to_a
  end

  def minutes
    [ "00", "15", "30", "45" ]
  end

  def period
    [ "AM", "PM" ]
  end
end
