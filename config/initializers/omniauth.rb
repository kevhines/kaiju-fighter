Rails.application.config.middleware.use OmniAuth::Builder do
    #provider :google, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  end 