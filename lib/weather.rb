class Weather
  POSSIBLE_CONDITIONS = [:stormy, :rain]

  attr_accessor :condition

  def initialize
    @condition = :fine
  end

  def check_weather
    @condition = POSSIBLE_CONDITIONS.sample
  end

  # private
  # def randomise
  #   POSSIBLE_CONDITIONS.sample
  # end
end

# ruby lib/weather.rb
p weather = Weather.new
p weather.condition
p weather.check_weather
p weather.condition
