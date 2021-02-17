require_relative 'carriage'

class CargoCarriage < Carriage
  attr_reader :capacity

  def initialize(type, capacity)
    super(type)
    @capacity = capacity
    valid?
  end

  def valid?
    raise RangeError, 'Capacity should be > 0' if @capacity <= 0

    true
  end

end
