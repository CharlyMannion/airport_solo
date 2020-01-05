require 'air_traffic_control'
require 'airport'
require 'plane'
require 'weather'

DEFAULT_CAPACITY = 20

describe AirTrafficControl do
  subject(:atc) { described_class.new }
  let(:airport_double) { double :airport, dock: plane_double, remove: plane_double }
  let(:airport_double_capac) { double :airport, dock: plane_double, capacity: 30 }
  let(:airport_class_double) { double :airport_class, new: airport_double }
  let(:plane_double) { double :plane }

  describe '#initialize' do
    it 'has an instance of the aiport class' do
      allow(AirTrafficControl).to receive(:new).and_return(airport_double)
    end
    it 'knows the weather' do
      expect(atc.weather_forecast).to eq(:fine)
    end
  end

  describe '#land' do
    it 'should land a plane at an airport' do
      atc.land(plane_double, airport_double)
      expect(airport_double).to have_received(:dock).with(plane_double)
    end
    it 'should not be possible to land a plane at a full airport' do
      DEFAULT_CAPACITY.times { atc.land(atc.airport) }
      expect { atc.land(atc.airport) }.to raise_error "Airport full"
    end
    it 'should be able to land more than the default capacity for an airport, if the default capacity has been overriden' do
      (DEFAULT_CAPACITY + 1).times { atc.land(airport_double_capac) }
      expect { atc.land(airport_double_capac) }.to_not raise_error "Airport full"
    end
    it 'should raise an error if the weather is stormy' do
      allow(atc).to receive(:stormy?).and_return(true)
      expect { atc.land(airport_double) }.to raise_error "Weather too stormy to land"
    end
  end

  describe '#take_off' do
    before do
      atc.land(plane_double, airport_double)
    end
    it 'should tell the aiport which plane to take off' do
      atc.take_off(plane_double, airport_double)
      expect(airport_double).to have_received(:remove).with(plane_double)
    end
    it 'should raise an error if the weather is stormy' do
      allow(atc).to receive(:stormy?).and_return(true)
      expect { atc.take_off(plane_double, airport_double) }.to raise_error "Weather too stormy to take off"
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
