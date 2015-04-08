class Post < ActiveRecord::Base
  belongs_to :user

  def self.get_recent_posts
    return find_recent_posts
  end

  private

  def self.find_recent_posts
    output = []
    Post.all.each do |post|
      if (within_a_month?(post))
        output.push(post)
      end
    end
    return output
  end

  def self.within_a_month?(post)
    return ((Time.now.to_i - post.created_at.to_i).abs < 2_628_000)
  end
end
