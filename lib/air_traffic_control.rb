require_relative 'airport'
require_relative 'plane'
require_relative 'weather'

class AirTrafficControl
  attr_accessor :airport, :plane, :weather_forecast

  def initialize(airport_class = Airport, weather_forecast = Weather.new.condition)
    @airport_class = airport_class
    @airport = @airport_class.new
    @weather_forecast  = weather_forecast
  end

  def land(plane = Plane.new, airport)
    fail "Weather too stormy to land" if stormy?

    airport.dock(plane)
  end

  def take_off(plane, airport)
    airport.remove(plane)
  end

  private
  def stormy?
    @weather_forecast = :stormy
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
