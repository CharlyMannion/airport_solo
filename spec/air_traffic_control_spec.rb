require 'air_traffic_control'
require 'airport'
require 'plane'
require 'weather'

DEFAULT_CAPACITY = 20

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
  it 'responds to weather_forecast' do
    expect(subject).to respond_to :weather_forecast
  end

  describe '#initialize' do
    it 'has an instance of the aiport class' do
      airport_double = double :airport
      airport_class_double = double :airport_class, new: airport_double
      allow(AirTrafficControl).to receive(:new).and_return(airport_double)
    end
    it 'knows the weather' do
      atc = AirTrafficControl.new
      expect(atc.weather_forecast).to eq(:fine)
    end
  end

  describe '#land' do
    it 'should land a plane at an airport' do
      plane_double = double :plane
      airport_double = double :airport, dock: plane_double
      airport_class_double = double :airport_class, new: airport_double
      # weather_double = double :weather, condition: :fine
      atc = AirTrafficControl.new(airport_class_double)
      allow(atc).to receive(:weather_forecast).and_return(:fine)
      p atc.weather_forecast
      # allow(atc).to receive(:weather_forecast).and_return(weather_double)
      atc.land(plane_double, airport_double)
      expect(airport_double).to have_received(:dock).with(plane_double)
    end
    it 'should not be possible to land a plane at a full airport' do
      atc = AirTrafficControl.new
      DEFAULT_CAPACITY.times { atc.land(atc.airport) }
      expect { atc.land(atc.airport) }.to raise_error "Airport full"
    end
    it 'should be able to land more than the default capacity for an airport, if the default capacity has been overriden' do
      plane_double = double :plane
      airport_double = double :airport, dock: plane_double, capacity: 30
      airport_class_double = double :airport_class, new: airport_double
      atc = AirTrafficControl.new(airport_class_double)
      (DEFAULT_CAPACITY + 1).times { atc.land(atc.airport) }
    end
    it 'should raise an error if the weather is stormy' do
      plane_double = double :plane
      airport_double = double :airport, dock: plane_double
      airport_class_double = double :airport_class, new: airport_double
      # weather_double = double :weather, condition: :stormy
      atc = AirTrafficControl.new(airport_class_double)
      allow(atc).to receive(:weather_forecast).and_return(:stormy)
      p "fail if in the function"
      p atc.weather_forecast
      expect { atc.land(airport_double) }.to raise_error "Weather too stormy to land"
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
    it 'should raise an error if the weather is stormy' do

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
