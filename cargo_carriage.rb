require_relative 'carriage'

class CargoCarriage < Carriage
  attr_reader :capacity
  attr_accessor :load

  def initialize(type, capacity)
    super(type)
    @capacity = capacity
    valid?
  end

  def valid?
    raise RangeError, 'Capacity should be > 0' if @capacity <= 0

    true
  end

  def load_cargo(amount)
    'Not enough capacity' if @load + amount > @capacity || amount.negative?
    @load += amount
  end

  def free_space
    @capacity - @load
  end

end
