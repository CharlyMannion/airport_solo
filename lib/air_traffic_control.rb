require_relative 'airport'
require_relative 'plane'

class AirTrafficControl
  attr_accessor :airport, :plane

  def initialize(airport_class = Airport)
    @airport_class = airport_class
    @airport = @airport_class.new
  end

  def land(plane = Plane.new, airport)
    airport.dock(plane)
  end

  def take_off(plane, airport)
    airport.remove(plane)
  end
end

# feature test in console:
# ruby lib/air_traffic_control.rb
# p atc = AirTrafficControl.new
# p plane = Plane.new
# p atc.land(plane, atc.airport)
# 19.times { atc.land(atc.airport) }
# p atc.airport.planes
# atc.land(atc.airport)
# p atc.airport.planes
# p atc.take_off(plane, atc.airport)
# p atc.airport.planes
# p plane
