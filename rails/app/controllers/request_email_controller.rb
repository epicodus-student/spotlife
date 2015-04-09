class RequestEmailController < ApplicationController

  def create
    req_email = RequestEmail.new
    if req_email
      #respond to ember with success
    else
      #respond to ember with failure
    end
  end

end
