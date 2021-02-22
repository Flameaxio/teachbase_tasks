# frozen_string_literal: true

require_relative 'train'

# Cargo train class
class CargoTrain < Train
  def add_carriage(carriage)
    carriages.push carriage if !speed.positive? && carriage.type == :CargoCarriage
  end

  def remove_carriage(carriage)
    carriages.delete carriage if !speed.positive? && carriage.type == :CargoCarriage
  end
end
