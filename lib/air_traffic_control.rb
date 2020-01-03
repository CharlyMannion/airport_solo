require_relative 'airport'

class AirTrafficControl
  attr_accessor :airport, :plane

  def initialize(airport_class = Airport)
    @airport_class = airport_class
    @airport = @airport_class.new
  end
end
