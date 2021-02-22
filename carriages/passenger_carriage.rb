# frozen_string_literal: true

require_relative 'carriage'

# Passenger carriage class
class PassengerCarriage < Carriage

  attr_reader :number_of_seats, :occupied_seats

  def initialize(type, number_of_seats, brand)
    raise ArgumentError if number_of_seats.negative?

    @number_of_seats = number_of_seats
    @occupied_seats = 0
    super type, brand
  end

  def occupy_seat
    return 'Full' if @occupied_seats == @number_of_seats

    self.occupied_seats += 1
    puts self.occupied_seats
  end

  def free_seats
    @number_of_seats - @occupied_seats
  end

  def to_s
    "Total number of seats: #{@number_of_seats}, Occupied seats: #{@occupied_seats}, Brand #{brand}"
  end
end
