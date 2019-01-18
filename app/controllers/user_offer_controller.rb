# frozen_string_literal: true

class UserOfferController < ApplicationController
  def create
    OfferMailer.offer.deliver_later
    redirect_to root_path, notice: "L'email à été envoyé"
  end
end
