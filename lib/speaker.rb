require 'person'

class Speaker < Person
  has_many :abstracts
  has_many :presentations
  has_many :feedbacks, :through => :presentations

  scope :old_timers, where("birthdate < ?", Date.civil(1980,1,1))
  scope :young_guns, where("birthdate >= ?", Date.civil(1980,1,1))

  scope :accepted, joins(:presentations)

  scope :good_ones, joins(:presentations => :feedbacks).where('rating > 3')

end
