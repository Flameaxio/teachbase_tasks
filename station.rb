# frozen_string_literal: true

# Station class
class Station
  attr_reader :name

  @all_stations = []

  class << self
    attr_accessor :all_stations
  end

  def initialize(name)
    @name = name
    @trains = []
    self.class.all_stations.push(self)
  end

  def self.all
    self.class.all_stations
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
end
