# frozen_string_literal: true

require_relative 'modules/validation'

# Station class
class Station
  include(Validation)

  attr_reader :name

  validate(:name, :presence)

  @all_stations = []

  class << self
    attr_accessor :all_stations

    def all
      self.class.all_stations
    end
  end


  def initialize(name)
    @name = name
    @trains = []
    self.class.all_stations.push(self)
    valid?
  end

  def accept_train(train)
    unless train.is_a? Train
      puts 'Wrong input'
      return false
    end
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
