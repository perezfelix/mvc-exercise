# frozen_string_literal: true

class OfferMailer < ApplicationMailer
  default to: -> { User.pluck(:email) },
          from: 'no-reply@mvc-exercise.com'

  def offer
    mail(subject: "Un nouveau produit est dans la boutique !")
  end
end
