class Train
  attr_reader :speed, :number, :type, :cars

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
  end

  def speed_up(amount)
    @speed += amount
  end

  def brake
    @speed = 0
  end

  def take_route(route)
    @route = route
    @current_station = 0
    @route.starting_station.accept_train(self)
  end

  def move_station
    @current_station += 1
    if @current_station > @route.in_between_stations.size
      'Train is in the end' unless @current_station == 1
      transfer(@route.starting_station, @route.ending_station)
      'Train reached the destination'
    end
    case @current_station
    when 1
      transfer(@route.starting_station, @route.in_between_stations[@current_station - 1])
    when @route.in_between_stations.size
      transfer(@route.in_between_stations.last, @route.ending_station)
      puts 'Train reached the destination'
    else
      transfer(@route.in_between_stations[@current_station - 1], @route.in_between_stations[@current_station])
    end
  end

  def print_stations
    puts "\n#{@route.get_stations(@current_station)}\n"
  end

  private

  def transfer(start, finish)
    start.send_train(self)
    finish.accept_train(self)
  end

end
