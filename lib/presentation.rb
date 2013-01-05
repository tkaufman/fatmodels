require 'active_record'

class Presentation < ActiveRecord::Base
  belongs_to :speaker
  belongs_to :abstract
  has_many :feedbacks
  belongs_to :conference
end
