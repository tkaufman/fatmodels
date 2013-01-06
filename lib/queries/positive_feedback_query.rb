module Queries

  class PositiveFeedbackQuery
    attr_reader :relation

    def initialize(relation = Feedback.scoped)
      @relation = relation
      @relation = @relation.joins(:feedbacks) unless @relation.klass == Feedback
      @relation = @relation.where("rating > ?", 3)
    end

    def all
      @relation.all
    end

    def find_each(&block)
      @relation.find_each(&block)
    end
  end

end