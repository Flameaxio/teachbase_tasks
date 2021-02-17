require_relative 'train'

class PassengerTrain < Train

  def initialize(number, type)
    super(number, type)
    @carriages = []
  end

  def add_car(car)
    @carriages.push car if car.type == :passenger
  end

  def remove_car(car)
    @carriages.delete car if car.type == :passenger
  end

end
