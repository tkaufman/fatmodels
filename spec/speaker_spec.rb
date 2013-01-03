require 'spec_helper'
require 'speaker'

describe Speaker do
  context "Save and Retrieve" do
    Given(:todd) {
      Speaker.new(:name => "Todd",
                  :email => "todd@testdouble.com",
                  :bio => "Todd codes things and watches Twilight movies",
                  :birthdate => Date.civil(1975, 7, 17))
    }
    When { todd.save }
    Then { todd.id.should_not be_nil }
  end
end
