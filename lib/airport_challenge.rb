require_relative 'plane'

class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes_landed = []
  end

  def land(plane)
    raise "Cannot land plane: airport full" if at_maximum_capacity
    @planes_landed.append(plane)
  end

  def take_off(plane)
  end

  private
  def at_maximum_capacity
    @planes_landed.length >= @capacity
  end

end