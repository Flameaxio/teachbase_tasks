# frozen_string_literal: true

# Generates train object depending on the type
class TrainFactory

  def self.get_train(number, type)
    return PassengerTrain.new(number) if type == :passenger.to_s
    return CargoTrain.new(number) if type == :cargo.to_s

    raise ArgumentError, 'Wrong type'
  end

  private

  def initialize; end
end
