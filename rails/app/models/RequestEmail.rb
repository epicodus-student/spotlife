class Requestemail

  def initialize
    send_mail
  end

  def send_mail
    User.get_next_batch.each do |user|
      binding.pry
      UserMailer.create(to: user.email)
    end
    return true
  end
end
