require_relative 'carriage'

class CargoCarriage < Carriage
  attr_reader :capacity

  def initialize(type, capacity)
    super(type)
    @capacity = capacity
    valid?
  end

  def valid?
    raise 'Capacity should be > 0', RangeError if @capacity <= 0

    true
  end

end
