require 'weather'

describe Weather do
  describe '#initialize' do
    it 'should have a default  weather condition of fine' do
      weather = Weather.new
      expect(weather.condition).to eq(:fine)
    end
  end

  describe 'check_weather' do
    it 'should change the weather condition' do
      p allow(subject).to receive(:check_weather) { :rain }
      p subject.condition
      # p expect(subject.condition).to eq(:rain)
    end
  end
end
