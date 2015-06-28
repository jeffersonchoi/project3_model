class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @greeting = "Hi #{user.name}"

    mail to: user.email, subject: "Welcome to the Bus Tracker App", from: "paul@paul.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.forgot_password.subject
  # 
  def forgot_password
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
