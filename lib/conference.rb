require 'active_record'

class Conference < ActiveRecord::Base

  has_many :abstracts
  has_many :presentations
  has_many :feedbacks
  has_many :speakers, :through => :presentations

end