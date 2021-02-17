require_relative 'carriage'

class PassengerCarriage < Carriage
  attr_reader :number_of_seats
  attr_accessor :occupied_seats

  def initialize(type, number_of_seats)
    @number_of_seats = number_of_seats
    @occupied_seats = 0
    super(type)
    valid?
  end

  def valid?
    raise RangeError, 'Number of seats should be > 0' if @number_of_seats <= 0

    true
  end

  def occupy_seat
    'Full' if @occupied_seats == @number_of_seats
    @occupied_seats += 1
  end

  def free_seats
    @number_of_seats - @occupied_seats
  end

  def to_s
    "Total number of seats: #{@number_of_seats}, Occupied seats: #{@occupied_seats}"
  end

end
