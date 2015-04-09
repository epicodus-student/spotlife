class RequestEmail
  before_create :send_mail

  def send_mail
    User.get_next_batch.each do |user|
      UserMailer.create(to: user.email)
    end
  end
end
