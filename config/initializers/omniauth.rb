OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '193237730885579', 'e26a147692e5cb30d869477f2cb7a5a8' , {:scope => 'friends_about_me,friends_birthday,publish_actions'}
end