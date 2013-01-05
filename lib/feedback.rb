require 'active_record'

class Feedback < ActiveRecord::Base
  belongs_to :presentation
  belongs_to :attendee
  belongs_to :conference
end
