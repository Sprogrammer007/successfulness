Rails.application.config.middleware.use Warden::Manager do |config|
  config.failure_app = lambda { |env| SessionsController.action(:new).call(env) }
  config.default_scope = :user

  config.scope_defaults :user,           :strategies => [:membership]

end

Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User.find_by_id(id)
end

Warden::Strategies.add(:membership) do

  def valid?
    params['login'] && params['password']
  end
  
  def authenticate!    
    user = User.find_by_email(params['login']) || User.find_by_username(params['login'])
    if user && user.authenticate(params['password'])
      success! user
    else
      fail "Invalid email or password"
    end
  end
end



