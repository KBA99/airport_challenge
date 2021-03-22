require_relative 'plane'

class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes_landed = []
  end

  def land(plane)
    raise "Cannot land plane when stormy" if stormy?
    raise "Cannot land plane: airport full" if full?
    @planes_landed.append(plane)
  end

  def take_off(plane)
    raise "Cannot take off plane when stormy" if stormy?
  end

  private

  def full?
    @planes_landed.length >= @capacity
  end

  # this code is affecting the 100% code coverage
  def stormy?
    p rand(1..7) > 5
  end
end