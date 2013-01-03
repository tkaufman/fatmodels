require 'person'

class Attendee < Person
  has_many :feedbacks
end
