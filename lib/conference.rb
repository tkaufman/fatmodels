require 'ostruct'
require 'active_record'
require 'active_support'
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
    @geo_coordinates ||= geo_code(location)
  end

  private

  def geo_code(location)
    # some fakey-fake geo_code API lib here
    # hardcoded to Kalahari's coords for convenience
    OpenStruct.new(
      :latitude => 41.382745,
      :longitude => -82.642276
    )
  end

end
