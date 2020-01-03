require 'air_traffic_control'
require 'airport'

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

end

# require './lib/air_traffic_control.rb'
# atc = AirTrafficControl.new
