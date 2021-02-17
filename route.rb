class Route
  attr_accessor :in_between_stations, :starting_station, :ending_station


  def initialize(starting_station, ending_station)
    @starting_station = starting_station
    @ending_station = ending_station
    @in_between_stations = []
    valid?
  end

  def valid?
    raise ArgumentError, "Starting and ending stations can't be nil" if @starting_station.nil? || @ending_station.nil?

    true
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
      puts "Current station: #{@in_between_stations[index-1].name}\n" \
      'Next station:' \
      "#{@in_between_stations[index].nil? ? @ending_station.name : @in_between_stations[index].name}\n" \
      "Previous station: #{@in_between_stations[index - 2].name}"
    end
  end
end
