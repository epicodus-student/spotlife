require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "update_request" do
    let(:mail) { UserMailer.update_request }

    it "renders the headers" do
      binding.pry
      expect(mail.subject).to eq("Update request")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
