class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= warden.user(:user)
  end

  helper_method :current_user

  def authenticate_user!
    unless warden.authenticated?
      set_flash_message :alert, :restricted, {scope: "failure"}
      redirect_to root_path
    end
  end

  def authenticate_student!
    unless warden.authenticated? && warden.user(:user).kind_of?(Student)
      set_flash_message :alert, :restricted, {scope: "failure"}
      redirect_to root_path
    end
  end 

  def authenticate_teacher!
    unless warden.authenticated? && warden.user(:user).kind_of?(Teacher)
      set_flash_message :alert, :restricted, {scope: "failure"}
      redirect_to root_path
    end
  end

  protected

    def resource 
      @resource ||= ( params[:type].constantize )
    end

    def resource_name
      @resource_name ||= params[:type].downcase.to_sym
    end
    
    def warden
      env['warden']
    end

    def set_flash_message(key, kind, options = {})
      message = find_message(kind, options)
      if options[:now]
        flash.now[key] = message if message.present?
      else
        flash[key] = message if message.present?
      end
    end

    # Get message for given
    def find_message(kind, options = {})
      options[:scope] ||= i18n_scope
      I18n.t(kind, options)
    end

end
