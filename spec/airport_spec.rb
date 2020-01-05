require 'airport'
DEFAULT_CAPACITY = 20

describe Airport do
  subject(:airp) { described_class.new }
  subject(:airpcapac) { described_class.new(capacity = 30) }
  let(:plane_double) { double :plane }

  it 'responds to planes' do
    expect(subject).to respond_to :planes
  end

  describe '#initialize' do
    it 'should have no planes' do
      expect(airp.planes).to eq([])
    end
    it 'should have a default capacity' do
      expect(airp.capacity).to eq(DEFAULT_CAPACITY)
    end
    it 'should accept a capacity greater than default capacity' do
      expect(airpcapac.capacity).to eq(30)
    end
    it 'should allow more planes to land if the capacity is higher than the default' do
      (DEFAULT_CAPACITY + 1).times { airpcapac.dock }
    end
  end

  describe '#dock' do
    it 'should add a plane to planes' do
      airp.dock(plane_double)
      expect(airp.planes).to include(plane_double)
    end
    it 'should raise an error if the docking station is full' do
      DEFAULT_CAPACITY.times { airp.dock }
      expect { airp.dock }.to raise_error "Airport full"
    end
    it 'should raise an error if you try to dock a plane that has landed' do
      airp.dock(plane_double)
      expect { airp.dock(plane_double) }.to raise_error "Plane has already landed"
    end
  end

  describe '#remove' do
    it 'should remove a plane from the aiport' do
      airp.dock(plane_double)
      airp.remove(plane_double)
      expect(airp.planes).to eq([])
    end
    it 'should raise an error if the plane is not in the airport' do
      expect { airp.remove(plane_double) }.to raise_error "Plane not docked at this airport"
    end
  end
end
