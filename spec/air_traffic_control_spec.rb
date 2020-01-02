require 'air_traffic_control'

describe AirTrafficControl do
  it 'responds to airport' do
    expect(subject).to respond_to :airport
  end

  # describe '#initialize' do
  #   it 'should have an aiport' do
  #     airport_double = double :airport
  #     allow(AirTrafficControl).to receive(:new).and_return(airport_double)
  #   end
  # end
end

# require './lib/air_traffic_control.rb'
