require_relative 'train'

class PassengerTrain < Train

  def initialize(number, type)
    super(number, type)
    @cars = []
  end

  def add_car(car)
    @cars.push car if car.type == :passenger
  end

  def remove_car(car)
    @cars.delete car if car.type == :passenger
  end

end
