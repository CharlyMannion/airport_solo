require_relative 'airport'

class AirTrafficControl
  attr_accessor :airport, :plane

  def initalize(airport = Airport.new)
    @airport = airport
  end
end
