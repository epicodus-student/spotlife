class RequestEmailController < ApplicationController

  def create
    req_email = RequestEmail.new
    respond_to do |format|
      msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
      format.json  { render :json => msg } # don't do msg.to_json
    end
  end

end
