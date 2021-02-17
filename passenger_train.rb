require_relative 'train'

class PassengerTrain < Train

  def initialize(number)
    super(number)
    @carriages = []
  end

  def add_carriage(carriage)
    @carriages.push carriage if carriage.type == :passenger
  end

  def remove_carriage(carriage)
    @carriages.delete carriage if carriage.type == :passenger
  end

end
