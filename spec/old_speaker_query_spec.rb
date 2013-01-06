require 'spec_helper'
require 'queries/old_speaker_query'

describe Queries::OldSpeakerQuery do
  Given!(:jim) { Speaker.create(:name => "Jim Holmes", :birthdate => Date.civil(1945, 5, 12)) }
  Given!(:jason) { Speaker.create(:name => "Jason Karns", :birthdate => Date.civil(1985, 3, 20)) }
  Given(:query) { Queries::OldSpeakerQuery.new }

  context "Returns Oldies with All" do
    When(:results) { query.all }
    Then do
      results.should have(1).speaker
      results.first.should == jim
    end
  end

  context "Allows Iteration with Each" do
    Then do
      query.find_each do |speaker|
        speaker.name.should == jim.name
        speaker.birthdate.should == jim.birthdate
      end
    end
  end

  context "Provides Access to the Arel" do
    When(:result) { query.relation }
    Then do
      result.class.should == ActiveRecord::Relation
    end
  end
end