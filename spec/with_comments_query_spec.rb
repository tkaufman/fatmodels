require 'with_comments_query'
require 'spec_helper'

describe WithCommentsQuery do

  Given!(:comment) { Feedback.create(:comment => "HERE IS A COMMENT") }
  Given!(:no_comment) { Feedback.create(:comment => nil) }
  Given(:query) { WithCommentsQuery.new }

  context "Should return the non-null comment" do
    When(:results) { query.all }
    Then do
      results.should have(1).feedback
      results.should include(comment)
      results.should_not include(no_comment)
    end
  end

  context "Chained query fun!" do
    Given { Feedback.update_all(:rating => 4) }
    Given(:chained_query) { PositiveFeedbackQuery.new(query.relation) }
    When(:results) { chained_query.all }
    Then do
      results.should have(1).feedback
      results.should include(comment)
      results.should_not include(no_comment)
    end
  end

end