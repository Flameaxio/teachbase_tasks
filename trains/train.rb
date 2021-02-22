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

  attr_accessor :speed, :number, :carriages, :current_station

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

  def speed_down(amount)
    @speed -= amount
    brake if @speed.negative?
  end

  def brake
    @speed = 0
  end

  def take_route(route)
    @route = route
    @current_station = 0
    @route.stations.first.accept_train(self)
  end

  def move_station
    return 'End of the route' if @current_station.next_station.nil?

    puts "12333333333333333333333333333333333333333333333333333333"

    @current_station = @current_station.next_station
  end

  def print_stations
    puts "\n#{@route.get_stations(@current_station)}\n"
  end

  def iterate_carriages(&block)
    @carriages.map(&block)
  end

  def to_s
    "Number: #{@number}, Type: #{type}, Carriages: #{@carriages.count}, Speed: #{@speed}, Station: #{@current_station}"
  end
end
