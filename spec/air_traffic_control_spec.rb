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
  it 'responds to land' do
    expect(subject).to respond_to :land
  end

  describe '#initialize' do
    it 'has an instance of the aiport class' do
      airport_double = double :airport
      airport_class_double = double :airport_class, new: airport_double
      allow(AirTrafficControl).to receive(:new).and_return(airport_double)
    end
  end

  describe '#land' do
    it 'should land a plane at an airport' do
      plane_double = double :plane
      airport_double = double :airport, dock: plane_double
      airport_class_double = double :airport_class, new: airport_double
      atc = AirTrafficControl.new(airport_class_double)
      atc.land(plane_double, airport_double)
      expect(airport_double).to have_received(:dock).with(plane_double)
    end
    it 'should not be possible to land a plane at a full airport' do
      atc = AirTrafficControl.new
      20.times { atc.land(atc.airport) }
      expect { atc.land(atc.airport) }.to raise_error "Airport full"
    end
  end

  describe '#take_off' do
    it 'should tell the aiport which plane to take off' do
      plane_double = double :plane
      airport_double = double :airport, dock: plane_double, remove: plane_double
      airport_class_double = double :airport_class, new: airport_double
      atc = AirTrafficControl.new(airport_class_double)
      atc.land(plane_double, airport_double)
      atc.take_off(plane_double, airport_double)
      expect(airport_double).to have_received(:remove).with(plane_double)
    end
  end

end

# require './lib/air_traffic_control.rb'
# atc = AirTrafficControl.new
# plane = Plane.new
# atc.land(plane, atc.airport)
# atc.airport.planes
# atc.take_off(plane, atc.airport)
# atc.airport.planes
# plane
