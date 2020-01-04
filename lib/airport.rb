class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def dock(plane)
    @planes << plane
  end

  def remove(plane)
    @planes = @planes-[plane]
  end
end
