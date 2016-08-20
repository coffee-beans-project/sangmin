OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1841534816075942', 'ff9f20cff3cd13d0063248dc5525d4b9', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end