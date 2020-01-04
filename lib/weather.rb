class Weather
  attr_accessor :condition

  def initialize
    @condition = 'fine'
  end

  def check_weather
    @condition = weather.randomise
  end

  private
  def randomise
    [:stormy, :rain].sample
  end
end
