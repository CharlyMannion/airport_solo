class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def dock(plane)
    @planes << plane
  end
end