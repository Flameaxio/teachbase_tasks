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

  attr_accessor :number, :current_station
  attr_writer :speed, :carriages

  @trains = []
  @speed = 0

  def carriages
    @carriages ||= []
  end

  def speed
    @speed ||= 0
  end


  def initialize(number, brand)
    @number = number
    self.brand = brand
    if self.class.trains.nil?
      Train.trains.push(self)
    else
      self.class.trains.push(self)
    end
    register_instance
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

    @current_station = @current_station.next_station
  end

  def print_stations
    puts "\n#{@route.get_stations(@current_station)}\n"
  end

  def iterate_carriages(&block)
    @carriages.map(&block)
  end

  def to_s
    "Number: #{@number}, Type: #{type}, Carriages: #{@carriages.count}," \
 "Speed: #{@speed}, Station: #{@current_station}, Brand #{brand}"
  end
end
