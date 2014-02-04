OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :developer unless Rails.env.production?
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], scope: 'email', display: 'popup'
end

# Rails.application.config.middleware.use OmniAuth::Builder do
# 	provider :identity, on_failed_registration: lambda { |env| IdentitiesController.action(:new).call(env) }
# end
