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

 def self.get_next_five
    get_eligible.sample(5)
 end

 private

 def self.get_eligible
   return 0
 end

 def generate_authentication_token
   loop do
     token = Devise.friendly_token
     break token unless User.where(authentication_token: token).first
   end
 end
end
