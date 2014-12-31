class SessionsController < Devise::SessionsController
  respond_to :json
  # POST /resource/sign_in

  def new

    if warden.message.present?
      render :json => {:errors => "{email: #{warden.message}}" }, :status => 401
    else
      render :json=> {message: [I18n.t("devise.failure.already_authenticated")]}, :status => 401
    end
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    respond_with resource
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    message = find_message(:signed_out, {}) 
    render :json=> {:success => true, :message => message }, :status => 200
  end

  private
    def require_no_authentication
      assert_is_devise_resource!
      return unless is_navigational_format?
      no_input = devise_mapping.no_input_strategies

      authenticated = if no_input.present?
        args = no_input.dup.push scope: resource_name
        warden.authenticate?(*args)
      else
        warden.authenticated?(resource_name)
      end

      if authenticated && resource = warden.user(resource_name)
        render :json=> {errors: {message: [I18n.t("devise.failure.already_authenticated")]} }, :status=>401
      end
    end

end