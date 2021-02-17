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

  def get_stations(index)
    if index.zero?
      puts "Current station (at start): #{@starting_station.name}\n" \
      "Next station: #{@in_between_stations[index].name}"
    elsif index == @in_between_stations.size
      puts "Current station (last station): #{@ending_station.name}\n" \
      "Previous station: #{@in_between_stations.last}"
    else
      puts "Current station: #{@in_between_stations[index + 1]}\n" \
      "Next station: #{@in_between_stations[index + 2].nil? ? @ending_station : @in_between_stations[index + 2]}\n" \
      "Previous station: #{@in_between_stations[index]}"
    end
  end
end
