class Api::RequestEmailsController < ApplicationController

  def index

  end

  def create
    req_email = RequestEmail.new
    respond_to do |format|
      msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
      format.json  { render :json => msg } # don't do msg.to_json
    end
  end
end
