require 'delegate'

class Rating < DelegateClass(Fixnum)

  def poor?
    self < 3
  end

  def good?
    self > 3
  end

end
