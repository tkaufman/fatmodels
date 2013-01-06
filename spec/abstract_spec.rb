require 'spec_helper'
require 'abstract'
require 'confirmation_emailer'

describe Abstract do

  Given(:todd) { Speaker.create(:name => "The Todd", :email => "todd@testdouble.com") }

  context "Initial status is Submitted" do
    Given(:abstract) { Abstract.new(:speaker => todd) }
    When { abstract.save }
    Then { abstract.status.should == "Submitted" }
  end

  context "Confirmation Sent" do
    Given { ConfirmationEmailer.expects(:send_email).once }
    When { Abstract.create(:title => "Rails Bloat", :speaker => todd) }
    Then { true.should be_true } #need a then but mock not blowing up is our expectation
  end

  context "process_acceptance" do
    Given(:codemash) { Conference.create(:name => "Codemash", :begins => Date.new(2013, 1, 8), :ends => Date.new(2013, 1, 11) ) }
    Given!(:abstract) { Abstract.create(:title => 'Fat Rails', :speaker => todd, :conference => codemash) }

    context "non status change" do
      Given { ConfirmationEmailer.expects(:send_email).never }
      When { abstract.update_attribute(:title, "Chunky Rails") }
      Then { true.should be_true } #need a then but mock not blowing up is our expectation
    end

    context "status change to Rejected" do
      Given { ConfirmationEmailer.expects(:send_email).never }
      When { abstract.update_attribute(:status, "Rejected") }
      Then { true.should be_true } #need a then but mock not blowing up is our expectation
    end

    context "status change to Accepted" do
      Given { ConfirmationEmailer.expects(:send_email).once }
      When { abstract.update_attribute(:status, "Accepted") }
      Then do
        pres = Presentation.where(:speaker_id => todd.id, :abstract_id => abstract.id).first
        pres.should_not be_nil
        pres.presented_on.should be_between(codemash.begins, codemash.ends)
      end
    end
  end

end