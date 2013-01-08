require 'forwardable'
require 'active_record'
require 'rating_serializer'

class Feedback < ActiveRecord::Base
  extend Forwardable
  include Comparable

  belongs_to :presentation
  belongs_to :attendee
  belongs_to :conference

  scope :good_ones, where("rating > 3")
  scope :with_comments, where("comment IS NOT NULL")

  serialize :rating, RatingSerializer.new
  def_delegators :rating, :poor?, :good?

  def <=>(other)
    rating <=> other.rating
  end

end
