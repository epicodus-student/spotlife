require 'rails_helper'

describe User do

  before :each do
    @no_post = User.create({:email => "test@test.com", :password => "12345678", :password_confirmation => "12345678"})
    User.create({:email => "test1@test.com", :password => "12345678", :password_confirmation => "12345678"})
    User.create({:email => "test2@test.com", :password => "12345678", :password_confirmation => "12345678"})
    User.create({:email => "test3@test.com", :password => "12345678", :password_confirmation => "12345678"})
    User.create({:email => "test4@test.com", :password => "12345678", :password_confirmation => "12345678"})
    @has_post = User.create({:email => "test5@test.com", :password => "12345678", :password_confirmation => "12345678"})
    @has_post.posts << Post.create(:body => "This is my story.")
  end

  describe '.get_next_five' do

    it 'returns five random users who have not posted.' do
      expect(User.get_next_five.class).to eq(Array)
      binding.pry
      expect(User.get_next_five.include?(@no_post)).to eq(true)
      expect(User.get_next_five.include?(@has_post)).to eq(false)
    end
  end
end
