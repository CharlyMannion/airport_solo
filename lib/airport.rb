class Airport
  attr_accessor :planes

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
    @planes.count >= 20
  end
end
