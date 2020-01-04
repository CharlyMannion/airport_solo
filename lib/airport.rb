class Airport
  attr_accessor :planes
  DEFAULT_CAPACITY = 20

  def initialize
    @planes = []
  end

  def dock(plane = Plane.new)
    fail "Airport full" if full?
    @planes << plane
  end

  def remove(plane = Plane.new)
    @planes -= [plane]
  end

  private
  def full?
    @planes.count >= DEFAULT_CAPACITY
  end
end
