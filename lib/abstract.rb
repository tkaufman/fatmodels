require 'active_record'

class Abstract < ActiveRecord::Base
  belongs_to :speaker
  belongs_to :conference

  before_create do |abstract|
    abstract.status = "Submitted"
  end

  after_create :send_confirmation_email

  after_save :process_acceptance


private

  def send_confirmation_email
    ConfirmationEmailer.send_email(speaker.email, "Abstract Received", "Your abstract, '#{title}' has been received.")
  end

  def process_acceptance
    if status_changed? && status == "Accepted"
      scheduled_time = conference.next_available_timeslot
      Presentation.create(:abstract => self,
                          :speaker => speaker,
                          :conference => conference,
                          :presented_on => scheduled_time)
      ConfirmationEmailer.send_email(speaker.email, "Abstract Accepted", "Your abstract, '#{title}' has been accepted!")
    end
  end

end
