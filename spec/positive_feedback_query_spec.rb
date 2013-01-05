require 'spec_helper'
require 'positive_feedback_query'

describe PositiveFeedbackQuery do
  Given!(:good_feedback) { Feedback.create(:rating => 5) }
  Given!(:marginal_feedback) { Feedback.create(:rating => 3) }
  Given!(:bad_feedback) { Feedback.create(:rating => 1) }
  Given(:query) { PositiveFeedbackQuery.new }

  context "Returns Ratings Above 3" do
    When(:results) { query.all }
    Then do
      results.should have(1).feedback
      results.first.should == good_feedback
    end
  end

  context "Returns Presentations when Passed Presentations" do
    Given!(:great_prez) { Presentation.create }
    Given!(:great_feedback) { Feedback.create(:rating => 5, :presentation => great_prez) }
    Given!(:bad_prez) { Presentation.create }
    Given!(:bad_feedback) { Feedback.create(:rating => 1, :presentation => bad_prez) }
    Given(:prez_query) { PositiveFeedbackQuery.new(Presentation.scoped) }
    When(:results) { prez_query.all }
    Then do
      results.should include(great_prez)
      results.should_not include(bad_prez)
    end
  end

  context "Returns Conferences when Passed Confereneces" do
    Given!(:codemash_2013) { Conference.create(:name => "Codemash") }
    Given!(:great_feedback) { Feedback.create(:rating => 5, :conference => codemash_2013) }
    Given!(:basket_weaving_2013) { Conference.create(:name => "Basket Weaving 2013") }
    Given!(:bad_feedback) { Feedback.create(:rating => 1, :conference => basket_weaving_2013) }
    Given(:conf_query) { PositiveFeedbackQuery.new(Conference.scoped) }
    When(:results) { conf_query.all }
    Then do
      results.should have(1).conference
      results.should include(codemash_2013)
      results.should_not include(basket_weaving_2013)
    end
  end
end