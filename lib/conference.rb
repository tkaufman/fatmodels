require 'ostruct'

require 'active_record'
require 'active_support'

require 'coordinates'
require 'duration'

class Conference < ActiveRecord::Base

  has_many :abstracts
  has_many :presentations
  has_many :feedbacks
  has_many :speakers, :through => :presentations


  def next_available_timeslot
    begins.to_time
  end

  delegate :overlaps?, :to => :duration
  def duration
    @duration ||= Duration.new begins..ends
  end

  def before?(other_conference)
    duration.before? other_conference.duration
  end

  def after?(other_conference)
    duration.after? other_conference.duration
  end

  def geo_coordinates
    @geo_coordinates ||= Coordinates.from_location(location)
  end

end
