# frozen_string_literal: true

# Creates object of the train with specified type
module TrainFactory
  def self.get_train(number, type)
    return PassengerTrain.new(number) if type == :passenger.to_s
    return CargoTrain.new(number) if type == :cargo.to_s

    raise ArgumentError, 'Wrong type'
  end
end
