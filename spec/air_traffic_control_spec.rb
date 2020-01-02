require 'air_traffic_control'

describe AirTrafficControl do
  it 'responds to airport' do
    expect(subject).to respond_to :airport
  end
  it 'responds to plane' do
    expect(subject).to respond_to :plane
  end

end

# require './lib/air_traffic_control.rb'
# atc = AirTrafficControl.new
