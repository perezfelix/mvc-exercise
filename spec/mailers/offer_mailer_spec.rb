# frozen_string_literal: true

require "rails_helper"

RSpec.describe OfferMailer, type: :mailer do
  describe "spam" do
    let(:mail) { OfferMailer.offer }

    it "set the subject" do
      expect(mail.subject).to eq("Un nouveau produit est dans la boutique !")
    end

    it "set the sender" do
      expect(mail.from).to eq(["no-reply@mvc-exercise.com"])
    end
  end
end
