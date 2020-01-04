require 'air_traffic_control'
require 'airport'
require 'plane'

describe AirTrafficControl do
  it 'responds to airport' do
    expect(subject).to respond_to :airport
  end
  it 'responds to plane' do
    expect(subject).to respond_to :plane
  end

  describe '#initialize' do
    it 'has an instance of the aiport class' do
      airport_double = double :airport
      airport_class_double  = double :airport_class, new: airport_double
      allow(AirTrafficControl).to receive(:new).and_return(airport_double)
    end
  end

  describe '#land' do
    it 'should land a plane at an airport' do
      airport_double = double :airport
      airport_class_double  = double :airport_class, new: airport_double
      atc = AirTrafficControl.new(airport_class_double)
      plane_double = double :plane
      p atc.airport
      # atc.land(plane_double, atc.airport)
      # expect(atc.airport.planes).to include(plane_double)
    end
  end

end

# require './lib/air_traffic_control.rb'
# atc = AirTrafficControl.new
# plane = Plane.new
# atc.land(plane, atc.airport)
# atc.airport.plane
