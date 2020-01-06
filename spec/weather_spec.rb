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
      "first condit below"
      weather.condition
      allow(weather).to receive(:check_weather).and_return(:rain)
      # expect(weather.condition).to eq(:rain)
    end
  end
end
