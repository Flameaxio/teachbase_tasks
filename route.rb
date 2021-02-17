# Route class
class Route
  def initialize(starting_station, ending_station)
    @starting_station = starting_station
    @ending_station = ending_station
    @in_between_stations = []
  end

  def add_station(station)
    @in_between_stations.push(station)
  end

  def delete_station(station)
    @in_between_stations.delete(station)
  end

  def print_stations
    puts @starting_station
    puts @in_between_stations
    puts @ending_station
  end
end
