require 'spec_helper'
require 'feedback'

describe Feedback do
  Given!(:poor_feedback) { Feedback.create(:rating => 1) }
  Given!(:medium_feedback) { Feedback.create(:rating => 3) }
  Given!(:good_feedback) { Feedback.create(:rating => 5) }

  describe "comparisons" do
    Then { poor_feedback.should be < medium_feedback }
    Then { good_feedback.should be > medium_feedback }
  end

  describe "#poor?" do
    Then { poor_feedback.should be_poor }
    Then { medium_feedback.should_not be_poor }
  end

  describe "#good?" do
    Then { good_feedback.should be_good }
    Then { medium_feedback.should_not be_good }
  end
end

