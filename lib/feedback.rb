require 'active_record'

class Feedback < ActiveRecord::Base
  include Comparable

  belongs_to :presentation
  belongs_to :attendee
  belongs_to :conference

  scope :good_ones, where("rating > 3")
  scope :with_comments, where("comment IS NOT NULL")

  def <=>(other)
    rating <=> other.rating
  end

  def poor?
    rating < 3
  end

  def good?
    rating > 3
  end
end
