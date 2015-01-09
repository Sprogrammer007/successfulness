class StaticPagesController < ApplicationController
  def home
    
  end
  def browse
    render layout: "app_ember"
  end
end
