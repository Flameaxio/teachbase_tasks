require_relative 'train'

class CargoTrain < Train
  attr_reader :cars

  def initialize(number, type)
    super(number, type)
    @cars = []
  end

  def add_car(car)
    @cars.push car if car.type == :cargo
  end

  def remove_car(car)
    @cars.delete car if car.type == :cargo
  end
end