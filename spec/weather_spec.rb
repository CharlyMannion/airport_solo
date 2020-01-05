require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#initialize' do
    it 'should have a default  weather condition of fine' do
      expect(weather.condition).to eq(:fine)
    end
  end

  describe 'check_weather' do
    it 'should change the weather condition' do
      p "first condit below"
      p weather.condition
      allow(weather).to receive(:check_weather).and_return(:rain)
      p "second condit below"
      p weather.condition
      p expect(weather.condition).to eq(:rain)
    end
  end
end
