require_relative 'plane'

class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes_landed = []
  end

  def land(plane)
    raise "Cannot land plane: airport full" if full?
    @planes_landed.append(plane)
  end

  def take_off(plane)
  end

  private
  
  def full?
    @planes_landed.length >= @capacity
  end

end