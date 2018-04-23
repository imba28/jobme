Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '2aff917b28213cdc1913', '23c04c001623ddf2e79f2fdbbddfb8b73cafad09'
end