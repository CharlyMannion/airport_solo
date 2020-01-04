require 'airport'

describe Airport do
  it 'responds to planes' do
    expect(subject).to respond_to :planes
  end

  describe '#initialize' do
    it 'should have no planes' do
      airp = Airport.new
      expect(airp.planes).to eq([])
    end
  end

  describe '#dock' do
    it 'should add a plane to planes' do
      airp = Airport.new
      plane_double = double :plane
      airp.dock(plane_double)
      expect(airp.planes).to include(plane_double)
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
