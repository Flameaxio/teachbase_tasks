require_relative 'train'

class CargoTrain < Train

  def initialize(number, type)
    super(number, type)
    @carriage = []
  end

  def add_car(car)
    @carriage.push car if car.type == :cargo
  end

  def remove_car(car)
    @carriage.delete car if car.type == :cargo
  end
end