class Airport
  attr_accessor :planes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def dock(plane = Plane.new)
    fail "Airport full" if full?
    fail "Plane has already landed" if @planes.include?(plane)

    @planes << plane
  end

  def remove(plane = Plane.new)
    fail "Plane not docked at this airport" unless @planes.include?(plane)
    
    @planes -= [plane]
  end

  private
  def full?
    @planes.count >= @capacity
  end
end
