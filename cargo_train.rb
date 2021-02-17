require_relative 'train'

class CargoTrain < Train

  def add_carriage(carriage)
    @carriages.push carriage if !speed.positive? && (carriage.type == :cargo)
  end

  def remove_carriage(carriage)
    @carriages.delete carriage if !speed.positive? && (carriage.type == :cargo)
  end
end
