require 'rails_helper'

describe User do

  before :each do
    @new_post = Post.create(:body => "Hello World, I'm a doctor/lawyer now.")
    @old_post = Post.create(:body => "Hello World, I'm a doctor/lawyer now.", :created_at => (Time.now - (86400 * 40)))
  end

  describe '.get_recent_posts' do

    it 'returns the most recent sample size number of posts' do
      expect(Post.get_recent_posts.class).to eq(Array)
      expect(Post.get_recent_posts.include?(@new_post)).to eq(true)
      expect(Post.get_recent_posts.include?(@old_post)).to eq(false)
    end
  end
end
