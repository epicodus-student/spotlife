require 'rails_helper'

describe Requestemail do

  before :each do
    @example_user = User.create({:email => "test@test.com", :password => "12345678", :password_confirmation => "12345678"})
  end

  describe '.get_recent_posts' do

    it 'Emails selected users' do
      result = Requestemail.new
    end
  end
end
