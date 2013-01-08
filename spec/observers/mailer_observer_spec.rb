require 'spec_helper'
require 'observers/mailer_observer'
require 'abstract'
require 'speaker'

describe Observers::MailerObserver do

  Given{ Observers::MailerObserver.instance } # Usually called automatically but need to register with rails to do so


  context "speaker created" do
    Given { ConfirmationEmailer.expects(:send_email).once }
    When { Speaker.create(:name => "Todd", :email => "todd@testdouble.com") }
    Then { true.should be_true } # need a then but mock not blowing up is our expectation
  end

  context "abstract created" do
    Given(:todd) { Speaker.create(:name => "Todd", :email => "todd@testdouble.com") }
    Given { ConfirmationEmailer.expects(:send_email).times(3) } # need to remove callback to get to 2x (1 for speaker, 1 for abstract)
    When {  Abstract.create(:title => "Rails Bloat", :speaker => todd) }
    Then { true.should be_true } #need a then but mock not blowing up is our expectation
  end
end