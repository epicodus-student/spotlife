class UserMailer < ApplicationMailer
  default from: "aeb242@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.update_request.subject
  #
  def update_request(user)
    @greeting = "Greetings Epicodus Alumnus"

    mail to: user.email, subject: "What have you been up to?"
  end

  def send_spotlights(user)
    @greeting = "Greetings Epicodus Alumni"
    @user = user

    mail to: user.email, subject: "Spotlight of the Month"
  end
end
