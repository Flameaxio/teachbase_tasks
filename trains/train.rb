# frozen_string_literal: true

require_relative '../modules/brand_module'
require_relative '../modules/instance_counter'
require_relative '../modules/validation'

# Train class
class Train
  include(Validation)
  include(BrandModule)
  include(InstanceCounter)

  class << self
    attr_accessor :trains

    def find(number)
      trains ||= Train.trains
      trains.find do |x|
        x.number == number
      end
    end
  end

  attr_accessor :speed, :number, :carriages


  @trains = []


  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
    if self.class.trains.nil?
      Train.trains.push(self)
    else
      self.class.trains.push(self)
    end
    self.class.validate(:number, :format, option: /^[A-Z1-9]{3}-?[A-Z1-9]{2}$/)
    valid?
  end

  def type
    @type ||= self.class.to_s
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

  def iterate_carriages(&block)
    @carriages.map(&block)
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

  def to_s
    "Number: #{@number}, Type: #{@type}, Carriages: #{@carriages.count}"
  end
end
