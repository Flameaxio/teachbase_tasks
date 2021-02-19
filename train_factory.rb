# frozen_string_literal: true

# Creates object of the train with specified type
module TrainFactory
  def self.get_train(number, type)
    return PassengerTrain.new(number) if type == :passenger.to_s
    return CargoTrain.new(number) if type == :cargo.to_s

    raise ArgumentError, 'Wrong type'
  end

  def self.get_carriage(type, capacity: 0, number_of_seats: 0)
    return PassengerCarriage.new(type, number_of_seats) if type == :passenger.to_s
    return CargoCarriage.new(type, capacity) if type == :cargo.to_s

    raise ArgumentError, 'Wrong type'
  end
end
