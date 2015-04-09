class User < ActiveRecord::Base
  before_save :ensure_authentication_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts

 def ensure_authentication_token
   if authentication_token.blank?
     self.authentication_token = generate_authentication_token
   end
 end

 def self.get_next_batch
   size = calculate_sample_size
   return get_eligible.sample(size)
 end

private

 def self.calculate_sample_size
   if User.all.length > 12
     size = calculate_batch_size
   else
     size = 1
   end
   return size
 end

 def self.calculate_batch_size
   return ((User.all.length / 12).floor)
 end

 def self.get_eligible
   output = []
   User.all.each do |user|
     if posted_before?(user) || not_within_a_year?(user)
       output.push(user)
     end
   end
   return output
 end

 def self.posted_before?(user)
   user.posts == []
 end

 def self.not_within_a_year?(user)
   most_recent_post_time = user.posts.sort_by{ |obj| obj.created_at }.last.created_at
   return ((Time.now.to_i - most_recent_post_time.to_i).abs > 31_536_000)
 end

 def generate_authentication_token
   loop do
     token = Devise.friendly_token
     break token unless User.where(authentication_token: token).first
   end
 end
end
