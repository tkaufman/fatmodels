require 'delegate'

class Valuation < DelegateClass(Fixnum)

  def poor?
    self < 3
  end

  def good?
    self > 3
  end

end
