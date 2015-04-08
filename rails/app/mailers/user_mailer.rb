class UserMailer < ApplicationMailer
  default from: "from@example.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.update_request.subject
  #
  def update_request
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
