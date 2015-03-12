ActionMailer::Base.smtp_settings = {
  :domain   => Settings['mail.domain'],
  :address  => Settings['mail.smtp'],
  :port     => Settings['mail.port']
}
ActionMailer::Base.smtp_settings.merge!(:login => Settings['mail.login']) if Settings['mail.login'].present?
ActionMailer::Base.smtp_settings.merge!(:password => Settings['mail.password']) if Settings['mail.password'].present?
