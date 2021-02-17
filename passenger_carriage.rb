require_relative 'carriage'

class PassengerCarriage < Carriage
  attr_reader :number_of_seats

  def initialize(type, number_of_seats)
    super(type)
    @number_of_seats = number_of_seats
  end

  def valid?
    raise 'Number of seats should be > 0', RangeError if @number_of_seats <= 0
  end

end
