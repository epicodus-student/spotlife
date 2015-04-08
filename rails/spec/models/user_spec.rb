require 'rails_helper'

describe User do

  before :each do
    @no_post = User.create({:email => "test@test.com", :password => "12345678", :password_confirmation => "12345678"})
    @has_post = User.create({:email => "test5@test.com", :password => "12345678", :password_confirmation => "12345678"})
    @has_post.posts << Post.create(:body => "This is my story.")
  end

  describe '.get_next_batch' do

    it 'returns random users who have not posted.' do
      expect(User.get_next_batch.class).to eq(Array)
      expect(User.get_next_batch.include?(@no_post)).to eq(true)
      expect(User.get_next_batch.include?(@has_post)).to eq(false)
    end

    it 'returns users who have no posts made in the last year' do
      @no_post.posts << Post.create(:body => "This is my story.", :created_at => (Time.now - 41_536_000))
      expect(User.get_next_batch.class).to eq(Array)
      expect(User.get_next_batch.include?(@no_post)).to eq(true)
      expect(User.get_next_batch.include?(@has_post)).to eq(false)
    end
  end
end
