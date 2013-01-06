require 'spec_helper'
require 'conference'
require 'date'

describe Conference do
  Given!(:codemash2012) { Conference.create(
    :name   => "CODEMASH 2012!!!",
    :begins => Date.civil(2012, 1, 11),
    :ends   => Date.civil(2012, 1, 13),
    :location => "Sandusky, OH"
  ) }
  Given!(:codemash2013) { Conference.create(
    :name => "CODEMASH 2013!!!",
    :begins => Date.civil(2013, 1, 8),
    :ends   => Date.civil(2013, 1, 11),
    :location => "Sandusky, OH"
  ) }
  Given!(:pmp_bootcamp) { Conference.create(
    :name => "PMP Bootcamp",
    :begins => Date.civil(2013,1,7),
    :ends => Date.civil(2013,1,10),
    :location => "Chicago, IL"
  ) }

  describe "#duration" do
    Then { codemash2012.duration.should == (Date.civil(2012,1,11)..Date.civil(2012,1,13)) }
  end

  describe "#overlaps?" do
    context "with date" do
      Then { codemash2013.overlaps?(Date.civil(2013,1,10)).should be_true }
      Then { codemash2013.overlaps?(Date.civil(2013,1,12)).should be_false }
    end

    context "with range" do
      Then { codemash2013.overlaps?(Date.civil(2013,1,6)..Date.civil(2013,1,12)).should be_true }
      Then { codemash2013.overlaps?(Date.civil(2013,2,6)..Date.civil(2013,2,12)).should be_false }
    end

    context "with conference" do
      Then { codemash2013.overlaps?(pmp_bootcamp).should be_true }
      Then { codemash2013.overlaps?(codemash2012).should be_false }
    end
  end

  describe "#before?" do
    Then { codemash2012.before?(codemash2013).should be_true }
    Then { codemash2013.before?(codemash2012).should be_false }
  end

  describe "#after?" do
    Then { codemash2012.after?(codemash2013).should be_false }
    Then { codemash2013.after?(codemash2012).should be_true }
  end

  describe "#geo_coordinates" do
    Then do
      codemash2013.geo_coordinates.latitude.should == 41.382745
      codemash2013.geo_coordinates.longitude.should == -82.642276
    end
  end

end
