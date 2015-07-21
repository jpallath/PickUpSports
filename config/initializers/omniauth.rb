# Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :facebook, FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'], {:scope => 'user_about_me'}
# end
#

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['DEVISE_FB_API'], ENV['DEVISE_FB_SECRET']
end
