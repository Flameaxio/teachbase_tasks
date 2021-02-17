require_relative 'carriage'

class CargoCarriage < Carriage
  attr_reader :capacity

  def initialize(type, capacity)
    super(type)
    @capacity = capacity
  end

end