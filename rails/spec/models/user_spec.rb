require 'rails_helper'

describe User do

  before :each do
    User.create()

  describe '.get_next_five' do

    it 'returns five random users who have not posted.'
