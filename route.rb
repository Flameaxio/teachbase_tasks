# frozen_string_literal: true

# Route class
class Route

  def stations
    @stations ||= []
  end

  def initialize(*args)
    @stations = []
    args.each do |x|
      @stations << x
    end
    create_bonds
  end

  def create_bonds
    @stations.each_cons(2) do |a, b|
      a.next_station = b
      b.previous_station = a
    end
  end

  def add_station(station)
    unless station.is_a? Station
      puts 'Wrong input'
      return false
    end
    @stations.push station
  end

  def delete_station(station)
    @stations.delete station
  end

  def to_s
    @stations
  end

  def get_stations(index)
    @stations[index]
  end

  def iterate_route(&block)
    @stations.each(&block)
  end

  private

  def start_station(index)
    puts "Current station (at start): #{@stations.first}\n" \
      "Next station: #{@stations[index].name}"
  end

  def last_station
    puts "Current station (last station): #{@stations.last}\n" \
      "Previous station: #{@stations.last.previous_station}"
  end

  def in_between_station(index)
    puts "Current station: #{@stations[index - 1].name}\n" \
      'Next station:' \
      "#{@stations[index].nil? ? @stations.last : @stations[index].name}\n" \
      "Previous station: #{@stations[index - 2].name}"
  end
end
