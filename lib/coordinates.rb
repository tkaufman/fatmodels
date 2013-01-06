class Coordinates < Struct.new(:latitude, :longitude)

  def self.from_location(location)
    # some fakey-fake geo_code API lib here
    # hardcoded to Kalahari's coords for convenience
    new 41.382745, -82.642276
  end

end
