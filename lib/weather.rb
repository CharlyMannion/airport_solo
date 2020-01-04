class Weather
  POSSIBLE_CONDITIONS = [:stormy, :rain]

  attr_accessor :condition

  def initialize
    @condition = :fine
  end

  def check_weather
    @condition = weather.randomise
  end

  private
  def randomise
    POSSIBLE_CONDITIONS.sample
  end
end
