require_relative 'trains/train'
require_relative 'trains/passenger_train'
require_relative 'trains/cargo_train'
require_relative 'train_factory'
require_relative 'route'
require_relative 'station'
require_relative 'carriages/passenger_carriage'
require_relative 'carriages/cargo_carriage'
require_relative 'carriages/carriage'

class TrainController
  class << self
    @routes = []
    @stations = []
    @trains = []
    @carriages = []

    def user_actions
      @user_actions ||= {
        create: create_actions,
        show: show_actions
      }
    end

    def create_actions
      @create_actions ||= {
        route: :create_route,
        train: :choose_train_type
      }
    end

    def show_actions
      @show_actions ||= {
        route: :show_route,
        train: :show_train
      }
    end

    def create_route
      stations = []
      loop do
        puts 'Enter the name of the station (or stop to finish): '
        name = gets.chomp
        break if name == 'stop' && stations.size > 1

        stations << Station.new(name)
      end
      @routes << Route.new(stations)
    end

    def create_station
      puts 'Enter the name of the station: '
      name = gets.chomp
      @stations << Station.new(name)
    end

    def create_train
      puts 'Enter the number of the train: '
      number = gets.chomp
      puts 'Enter the type of the train: '
      type = gets.chomp
      @trains << TrainFactory.get_train(number, type)
    end

    def create_carriage
      puts 'Enter the type of the carriage: '
      type = gets.chomp
      send("create_#{type}_carriage")
    rescue NoMethodError
      retry
    end

    def show_route
      puts 'Routes: '
      @routes.each_with_index do |r, index|
        puts "#{index}. #{r}"
      end
      print 'Select route by index or type back: '
      gets.chomp
    end

    def show_station
      @stations.each_with_index { |s, index| "#{index}. #{s}" }
    end

    def show_train
      puts 'Trains: '
      @trains.each_with_index do |t, index|
        puts "#{index}. #{t}"
      end
      print 'Select train by index or type back: '
      gets.chomp
    end

    def show_carriage
      @carriages.each_with_index { |c, index| "#{index}. #{c}" }
    end

    private

    def create_passenger_carriage
      puts 'Enter the number of seats: '
      number_of_seats = gets.chomp
      @carriages << TrainFactory.get_carriage(:passenger, number_of_seats: number_of_seats)
    end

    def create_cargo_carriage
      puts 'Enter the capacity: '
      capacity = gets.chomp
      @carriages << TrainFactory.get_carriage(:passenger, capacity: capacity)
    end
  end
end
