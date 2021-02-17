# Importing classes
require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'passenger_carriage'
require_relative 'cargo_train'
require_relative 'cargo_carriage'

route = Route.new(Station.new('Перемога'), Station.new('Метробудiвникiв'))
route.add_station(Station.new('Олексіївська'))
route.add_station(Station.new('23-го серпня'))
route.add_station(Station.new('Ботанічний сад'))
route.add_station(Station.new('Наукова'))
route.add_station(Station.new('Держпром'))
route.add_station(Station.new('Архітектора Бекетова'))
route.add_station(Station.new('Захисників України'))
cargo_train = PassengerTrain.new('AS1231A')
puts Train.instances
cargo_train.take_route(route)
cargo_train.add_carriage(PassengerCarriage.new(:passenger, 64))
cargo_train.speed_up(100)
cargo_train.add_carriage(PassengerCarriage.new(:passenger, 32))
puts cargo_train.carriages
cargo_train.print_stations
cargo_train.move_station
cargo_train.print_stations
cargo_train.move_station
cargo_train.print_stations
another_cargo_train = CargoTrain.new('AS1231B')
puts Train.instances
another_cargo_train.take_route(route)
another_another_cargo_train = CargoTrain.new('AS1231C')
puts Train.instances
another_another_cargo_train.take_route(route)
passenger_train = PassengerTrain.new('AR1231P')
puts Train.instances
passenger_train.take_route(route)
puts 'All trains on station 1: '
route.starting_station.show_trains
puts 'Cargo: '
route.starting_station.show_trains(:CargoTrain)
puts 'Passenger: '
route.starting_station.show_trains(:PassengerTrain)
train = Train.find('AR1231P')
puts train.nil? ? 'nil' : train
puts PassengerTrain.instances
puts CargoTrain.instances
