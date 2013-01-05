require 'active_record'

class Feedback < ActiveRecord::Base
  belongs_to :presentation
  belongs_to :attendee
  belongs_to :conference

  scope :good_ones, where("rating > 3")
  scope :with_comments, where("comment IS NOT NULL")
end
