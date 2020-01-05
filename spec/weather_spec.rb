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
      obj = Weather.new
      p obj.condition
      p "check weather and return rain"
      p allow(obj).to receive(:check_weather) { :rain }
      p obj.condition
      p expect(obj.condition).to eq(:rain)
    end
  end
end
