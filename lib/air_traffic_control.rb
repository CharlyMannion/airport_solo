require_relative 'airport'
require_relative 'plane'

class AirTrafficControl
  attr_accessor :airport, :plane

  def initialize(airport_class = Airport)
    @airport_class = airport_class
    @airport = @airport_class.new
  end

  def land(plane, airport)
    airport.dock(plane)
  end

  def take_off(plane, airport)
    airport.remove(plane)
  end
end
