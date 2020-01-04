class Airport
  attr_accessor :planes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
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
    @planes.count >= @capacity
  end
end
