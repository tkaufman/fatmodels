require 'spec_helper'
require 'speaker'
require 'attendee'
require 'presentation'
require 'abstract'
require 'feedback'

describe Speaker do
  Given!(:todd) do
    Attendee.create(:name => "Todd",
                    :email => "todd@testdouble.com",
                    :birthdate => Date.civil(1975, 7, 17) )
  end
  Given!(:jason) do
    Speaker.create(:name => "Karnsy",
                    :email => "jason@testdouble.com",
                    :birthdate => Date.civil(1992, 4, 20) )
  end
  Given!(:abstract) do
    Abstract.create(:title => "Fat Models",
                    :description => "Need to be more skinny",
                    :speaker => jason)
  end
  Given!(:presentation) do
    Presentation.create(:speaker => jason,
                        :abstract => abstract,
                        :presented_on => Date.civil(2013, 1, 8))
  end
  Given!(:feedback) do
    Feedback.create(:presentation => presentation,
                    :attendee => todd,
                    :rating => 5,
                    :comment => "Best presentation ever!")
  end

  context "scopes" do
    When(:results) { Speaker.all }
    Then do
      results.should have(1).speaker
      results.first.should == jason
    end
  end
end
