require 'rails_helper'

describe RequestEmail do

  before :each do
    @example_user = User.create({:email => "test@test.com", :password => "12345678", :password_confirmation => "12345678"})
    @example_post = Post.create(:body => "Hello World, I'm a doctor/lawyer now.")
    @example_user.posts << @example_post
  end

  describe '.get_recent_posts' do

    it 'Emails selected users' do

      expect(RequestEmail.new).to eq(true)
    end
  end
end
