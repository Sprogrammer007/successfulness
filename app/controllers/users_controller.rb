class UsersController < ApplicationController
  
  before_filter :authenticate_user!

  def show
    render layout: "app_ember"
  end
end
