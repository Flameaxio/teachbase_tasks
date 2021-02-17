class Train
  attr_reader :speed
  attr_reader :number_of_cars

  def initialize(number, type, number_of_cars)
    @number = number
    @type = type
    @number_of_cars = number_of_cars
    @speed = 0
  end

  def speed_up(amount)
    @speed += amount
  end

  def brake
    @speed = 0
  end

  def add_car
    @number_of_cars += 1 if speed.zero?
  end

  def remove_car
    @number_of_cars -= 1 if speed.zero?
  end

  def take_route(route)
    @route = route
    @current_station = 0
  end

  def move_station
    @current_station += 1
  end

  def print_stations
    @route.get_stations(@current_station)
  end

end
