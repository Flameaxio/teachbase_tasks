# frozen_string_literal: true

# Station class
class Station

  attr_reader :name

  attr_accessor :trains, :previous_station, :next_station

  @all_stations = []

  class << self
    attr_accessor :all_stations

    def all
      self.class.all_stations
    end
  end

  def initialize(name, previous_station = nil, next_station = nil)
    @name = name
    @trains = []
    previous_station.next_station = self unless previous_station.nil?
    @previous_station = previous_station
    @next_station = next_station
    self.class.all_stations.push(self)
  end

  def accept_train(train)
    unless train.is_a? Train
      puts 'Wrong input'
      return false
    end
    train.current_station = self
    @trains.push(train)
  end

  def show_trains(type = nil)
    current_trains = @trains.select do |x|
      type.nil? ? x : x.type == type
    end
    return 'There are no trains' if current_trains.empty?

    current_trains.map(&:to_s)
  end

  def send_train(train)
    return 'There are no trains' if @trains.empty?

    @trains.delete(train)
  end

  def iterate_trains(&block)
    puts "Station: #{@name}"
    @trains.map(&block)
  end

  def to_s
    @name
  end
end
