require 'delegate'

class Duration < DelegateClass(Range)
  include Comparable

  alias_method :begins, :first
  alias_method :ends, :last

  def overlaps?(other)
    case other
    when Date then cover? other
    when Range, Duration then (first <= other.last && other.first <= last)
    when Conference then overlaps? other.duration
    end
  end

  def before?(other)
    self <= other
  end

  def after?(other)
    self >= other
  end

  def <=>(other)
    first <=> other.first
  end

end
