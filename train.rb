# frozen_string_literal: true

require_relative 'brand_module'
require_relative 'instance_counter'

# Train class
class Train
  attr_reader :speed, :number, :type

  @trains = []

  class << self
    attr_accessor :trains

    def find(number)
      trains ||= Train.trains
      trains.find do |x|
        x.number == number
      end
    end
  end

  include(BrandModule)
  include(InstanceCounter)

  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
    @type = self.class
    if self.class.trains.nil?
      Train.trains.push(self)
    else
      self.class.trains.push(self)
    end

    register_instance
  end

  def carriages
    @carriages.each do |x|
      puts "Carriage with type #{x.type}"
    end
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
    return last_station if @current_station > @route.in_between_stations.size

    in_between_station
  end

  def print_stations
    puts "\n#{@route.get_stations(@current_station)}\n"
  end

  def to_s
    "Number #{@number}, type #{@type}, carriages: #{@carriages.map(&:to_s)}"
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
