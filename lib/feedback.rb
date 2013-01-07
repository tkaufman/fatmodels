require 'forwardable'
require 'active_record'
require 'valuation'

class Feedback < ActiveRecord::Base
  extend Forwardable
  include Comparable

  belongs_to :presentation
  belongs_to :attendee
  belongs_to :conference

  scope :good_ones, where("rating > 3")
  scope :with_comments, where("comment IS NOT NULL")

  def_delegators :valuation, :poor?, :good?

  def valuation
    @valuation ||= Valuation.new rating
  end

  def <=>(other)
    valuation <=> other.valuation
  end

end
