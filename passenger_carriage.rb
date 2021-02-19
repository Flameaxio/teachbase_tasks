# frozen_string_literal: true

require_relative 'carriage'
require_relative 'accessors'

# Passenger carriage class
class PassengerCarriage < Carriage
  include(Accessors)
  include(Validation)

  attr_reader :number_of_seats

  attr_accessor_with_history :occupied_seats

  validate(:number_of_seats, :format, option: /[+]?\d+([.]\d+)?/)

  def initialize(type, number_of_seats)
    @number_of_seats = number_of_seats
    @occupied_seats = 0
    super type
    valid?
  end

  def occupy_seat
    return 'Full' if @occupied_seats == @number_of_seats

    self.occupied_seats += 1
  end

  def free_seats
    @number_of_seats - @occupied_seats
  end

  def to_s
    "Total number of seats: #{@number_of_seats}, Occupied seats: #{@occupied_seats}"
  end
end
