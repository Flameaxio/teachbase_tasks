# frozen_string_literal: true

require_relative 'trains/train'
require_relative 'route'
require_relative 'station'
require_relative 'carriages/carriage'
require_relative 'carriages/cargo_carriage'
require_relative 'trains/cargo_train'
require_relative 'carriages/passenger_carriage'
require_relative 'trains/passenger_train'
require_relative 'modules/train_actions'
require_relative 'modules/carriage_actions'
require_relative 'modules/station_actions'

# Text UI
class Main
  include(TrainActions)
  include(CarriageActions)
  include(StationActions)

  ACTIONS = {
    1 => :create_station,
    2 => :choose_train_type,
    3 => :add_carriage,
    4 => :remove_carriage,
    5 => :add_train_to_station,
    6 => :trains_on_station
  }.freeze
  attr_reader :stations, :trains

  def initialize
    @stations = []
    @trains = []
  end

  def text_ui
    loop do
      action = choose_action
      break if action.zero?

      send(ACTIONS[action])
    end
    #rescue StandardError
    #puts 'Wrong input'
    #retry
  end

  private

  attr_writer :stations, :trains, :route

  def choose_train_type
    puts 'Select the type of the train!
      1 - Passenger
      2 - Cargo'
    train_type = gets.chomp.to_i
    create_train(train_type)
  end

  def trains_list(type = nil)
    if type
      trains.map { |t| t.number if t.type == type }.compact.join(' ')
    else
      trains.map(&:number).join(' ')
    end
  end

  def choose_action
    puts "List of actions\n0 - Exit\n1 - Create stations\n2 - Create trains\n3 - Add carriages to the train
4 - Remove carriages from the train
5 - Put trains on the station
6 - List all the stations and trains on them
Enter number:"
    gets.chomp.to_i
  end
end

Main.new.text_ui
