require_relative 'train'

class PassengerTrain < Train

  def add_carriage(carriage)
    @carriages.push carriage if !speed.positive? && (carriage.type == :passenger)
  end

  def remove_carriage(carriage)
    @carriages.delete carriage if !speed.positive? && (carriage.type == :passenger)
  end

end
