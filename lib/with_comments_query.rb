class WithCommentsQuery

  attr_reader :relation

  def initialize(relation = Feedback.scoped)
    @relation = relation.where("comment IS NOT NULL")
  end

  def all
    @relation.all
  end

  def find_each(&block)
    @relation.find_each(&block)
  end
end