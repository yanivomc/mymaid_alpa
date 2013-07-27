OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '669116153102310' , '410219720d22196ef2796567c5cbb267'
end