# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: '587',
  domain: 'mydomain.net',
  user_name: 'khitroxs@gmail.com',
  password: '2612023555',
  authentication: :plain,
  enable_starttls_auto: true
}
