require 'queries/with_comments_query'
require 'queries/positive_feedback_query'
require 'feedback'
require 'spec_helper'

describe Queries::WithCommentsQuery do

  Given!(:comment) { Feedback.create(:comment => "HERE IS A COMMENT") }
  Given!(:no_comment) { Feedback.create(:comment => nil) }
  Given(:query) { Queries::WithCommentsQuery.new }

  context "Should return the non-null comment" do
    When(:results) { query.all }
    Then do
      results.should have(1).feedback
      results.should include(comment)
    end
  end

  context "Chained query fun!" do
    Given { comment.update_attribute(:rating, 4) }
    Given(:chained_query) { Queries::PositiveFeedbackQuery.new(query.relation) }
    When(:results) { chained_query.all }
    Then do
      results.should have(1).feedback
      results.should include(comment)
    end
  end

end