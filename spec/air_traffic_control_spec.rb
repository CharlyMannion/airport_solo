require 'air_traffic_control'
require 'airport'

describe AirTrafficControl do
  it 'responds to airport' do
    expect(subject).to respond_to :airport
  end
  it 'responds to plane' do
    expect(subject).to respond_to :plane
  end
  it 'responds to initialize' do
    expect(subject).to respond_to :initalize
  end

  describe '#initalize' do
    it 'has an instance of the aiport class' do
      airport_double = double :airport
      # airport_class_double  = double :airport_class, new: airport_double
      allow(subject).to receive(:new).and_return(airport_double)
      p "subject below"
      p subject
      expect(subject.airport).to eq(airport_double)
    end
  end

end

# require './lib/air_traffic_control.rb'
# atc = AirTrafficControl.new
