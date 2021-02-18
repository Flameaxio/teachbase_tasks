# frozen_string_literal: true

require_relative 'carriage'

# Passenger carriage class
class PassengerCarriage < Carriage
  attr_reader :number_of_seats

  def initialize(type, number_of_seats)
    super(type)
    @number_of_seats = number_of_seats
  end
end
