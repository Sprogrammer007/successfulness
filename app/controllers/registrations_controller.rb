class RegistrationsController < ApplicationController

  def new
    @resource = resource.new()
  
    @minimum_password_length = 8
  end

  def create
    Rails.logger.warn "#{params}"
    @user = resource.new(safe_params)
    if @user.save
      redirect_to root_path
    end
  end

  private

    def safe_params
      params.require(resource_name).permit(:username, :email, :password)
    end
end
