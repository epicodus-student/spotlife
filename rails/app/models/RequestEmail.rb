class Requestemail

  def initialize
    send_mail
  end

  def send_mail
    User.get_next_batch.each do |user|
      binding.pry
      UserMailer.update_request(user).deliver_now
    end
    return true
  end
end
