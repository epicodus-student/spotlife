class Post < ActiveRecord::Base
  belongs_to :user

  def self.get_recent_posts

  end

end
