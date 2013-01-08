module Queries
  class OldSpeakerQuery

    attr_reader :relation

    def initialize(relation = Speaker.scoped)
      @relation = relation.where("birthdate < ?", Date.civil(1980,1,1))
    end

    def all
      @relation.all
    end

    def find_each(&block)
      @relation.find_each(&block)
    end
  end
end