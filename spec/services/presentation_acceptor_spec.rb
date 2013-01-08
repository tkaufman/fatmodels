require 'spec_helper'
require 'services/presentation_acceptor'

describe Services::PresentationAcceptor do

  Given(:todd) { Speaker.create(:name => "The Todd", :email => "todd@testdouble.com") }
  Given(:codemash) { Conference.create(:name => "Codemash", :begins => Date.new(2013, 1, 8), :ends => Date.new(2013, 1, 11) ) }
  Given!(:abstract) { Abstract.create(:title => 'Fat Rails', :speaker => todd, :conference => codemash) }
  Given(:service) { Services::PresentationAcceptor.new(abstract) }

  context "process_acceptance" do
    Given { ConfirmationEmailer.expects(:send_email).with(todd.email, 'Abstract Accepted', anything).twice } # once if lifecycle callback is removed
    When { service.execute }
    Then do
      pres = Presentation.where(:speaker_id => todd.id, :abstract_id => abstract.id).first
      pres.should_not be_nil
      pres.presented_on.should be_between(codemash.begins, codemash.ends)
    end
  end

end