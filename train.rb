# frozen_string_literal: true

# Train class
class Train
  attr_reader :speed, :number_of_cars, :number, :type

  def initialize(number, type, number_of_cars)
    if %i[passenger cargo].include? type
      @number = number
      @type = type
      @number_of_cars = number_of_cars
      @speed = 0
    else
      puts 'Wrong input'
    end
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
    @route.starting_station.accept_train(self)
  end

  def move_station
    @current_station += 1
    return last_station if @current_station > @route.in_between_stations.size

    in_between_station
  end

  def print_stations
    puts "\n#{@route.get_stations(@current_station)}\n"
  end

  def to_s
    "Number #{@number}, type #{@type}, number of cars #{@number_of_cars}"
  end

  private

  def transfer(start, finish)
    start.send_train(self)
    finish.accept_train(self)
  end

  def last_station
    'Train is in the end' unless @current_station == 1
    transfer(@route.starting_station, @route.ending_station)
    'Train reached the destination'
  end

  def in_between_station
    stations = @route.in_between_stations
    case @current_station
    when 1
      transfer(@route.starting_station, stations[@current_station - 1])
    when @route.in_between_stations.size
      transfer(stations.last, @route.ending_station)
      puts 'Train reached the destination'
    else
      transfer(stations[@current_station - 1], stations[@current_station])
    end
  end
end
