require 'speaker'
require 'abstract'
require 'confirmation_emailer'

module Observers
  class MailerObserver < ActiveRecord::Observer
    observe :abstract, :speaker

    def after_create(model)
      ConfirmationEmailer.send_email(send_to(model), "#{model.class} information received", "Thank you for your submission!")
    end

    private

    def send_to(model)
      model.respond_to?(:email) ? model.email : model.speaker.email
    end
  end
end