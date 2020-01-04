require_relative 'airport'
require_relative 'plane'


class AirTrafficControl
  attr_accessor :airport, :plane

  def initialize(airport_class = Airport)
    @airport_class = airport_class
    @airport = @airport_class.new
  end

  def land(plane, airport)
    true
    # airport.dock(plane)
  end
end
