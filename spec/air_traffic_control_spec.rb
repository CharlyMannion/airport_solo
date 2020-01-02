require 'air_traffic_control'

describe AirTrafficControl do
  it 'responds to airport' do
    expect(subject).to respond_to :airport
  end 
end

# require './lib/air_traffic_control.rb'

# it 'responds to release_bike' do
#   expect(subject).to respond_to :release_bike
# end
