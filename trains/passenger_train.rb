# frozen_string_literal: true

require_relative 'train'

# Passenger train class
class PassengerTrain < Train


  def add_carriage(carriage)
    @carriages.push carriage if !speed.positive? && carriage.type == :PassengerCarriage
  end

  def remove_carriage(carriage)
    @carriages.delete carriage if !speed.positive? && carriage.type == :PassengerCarriage
  end
end
