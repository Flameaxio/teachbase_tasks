# frozen_string_literal: true

# Importing classes
require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'passenger_carriage'
require_relative 'cargo_train'
require_relative 'cargo_carriage'
require_relative 'train_factory'

route = Route.new(Station.new('Перемога'), Station.new('Метробудівників'))
route.add_station(Station.new('Олексіївська'))
route.add_station(Station.new('23-го серпня'))
route.add_station(Station.new('Ботанічний сад'))
route.add_station(Station.new('Наукова'))
route.add_station(Station.new('Держпром'))
route.add_station(Station.new('Архітектора Бекетова'))
route.add_station(Station.new('Захисників України'))
loop do
  begin
    puts 'Enter the number of the train (or stop): '
    number = gets.chomp
    break if number == 'stop'

    puts 'Enter the type of the train (passenger or cargo): '
    type = gets.chomp
    train = TrainFactory.get_train(number, type)
    puts "Created train: #{train}"
    route.starting_station.accept_train(train)
  rescue ArgumentError => e
    puts e.message
    retry
  end
end
station_block = proc { |x| printf "%15sTrain #{x.number} #{x.iterate_carriages(&:to_s)}\n", '' }
route_block = proc { |x| x.iterate_trains(&station_block) }
route.iterate_route(&route_block)
