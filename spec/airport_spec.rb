require 'airport'
DEFAULT_CAPACITY = 20

describe Airport do
  it 'responds to planes' do
    expect(subject).to respond_to :planes
  end

  describe '#initialize' do
    it 'should have no planes' do
      airp = Airport.new
      expect(airp.planes).to eq([])
    end
    it 'should have a default capacity' do
      airp = Airport.new
      expect(airp.capacity).to eq(DEFAULT_CAPACITY)
    end
    it 'should accept a capacity greater than default capacity' do
      airp = Airport.new(capacity=30)
      expect(airp.capacity).to eq(30)
    end
  end

  describe '#dock' do
    it 'should add a plane to planes' do
      airp = Airport.new
      plane_double = double :plane
      airp.dock(plane_double)
      expect(airp.planes).to include(plane_double)
    end
    it 'should raise an error if the docking station is full' do
      airp = Airport.new
      DEFAULT_CAPACITY.times { airp.dock }
      expect { airp.dock }.to raise_error "Airport full"
    end
  end

  describe '#remove' do
    it 'should remove a plane from the aiport' do
      airp = Airport.new
      plane_double = double :plane
      airp.dock(plane_double)
      airp.remove(plane_double)
      expect(airp.planes).to eq([])
    end
  end
end
