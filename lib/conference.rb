require 'ostruct'
require 'active_record'

class Conference < ActiveRecord::Base

  has_many :abstracts
  has_many :presentations
  has_many :feedbacks
  has_many :speakers, :through => :presentations


  def next_available_timeslot
    begins.to_time
  end

  def duration
    begins..ends
  end

  def overlaps?(other)
    case other
    when Date then duration.cover? other
    when Range then (duration.first <= other.last && other.first <= duration.last)
    when Conference then overlaps? other.duration
    end
  end

  def before?(other_conference)
    (begins <=> other_conference.begins) == -1
  end

  def after?(other_conference)
    (begins <=> other_conference.begins) == 1
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
