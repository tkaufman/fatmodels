class Speaker < Person
  has_many :abstracts
  has_many :presentations
  has_many :feedbacks, :through => :presentations
end