require 'rating'

class RatingSerializer
  def dump(rating)
    rating
  end

  def load(rating)
    Rating.new rating
  end
end
