# Importing classes
require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'passenger_carriage'
require_relative 'cargo_train'
require_relative 'cargo_carriage'
require_relative 'train_factory'

route = Route.new(Station.new('Перемога'), Station.new('Метробудiвникiв'))
route.add_station(Station.new('Олексіївська'))
route.add_station(Station.new('23-го серпня'))
route.add_station(Station.new('Ботанічний сад'))
route.add_station(Station.new('Наукова'))
route.add_station(Station.new('Держпром'))
route.add_station(Station.new('Архітектора Бекетова'))
route.add_station(Station.new('Захисників України'))
cargo_train = PassengerTrain.new('AS1231A')
cargo_train.take_route(route)
cargo_train.add_carriage(PassengerCarriage.new(:passenger, 64))
cargo_train.speed_up(100)
cargo_train.add_carriage(PassengerCarriage.new(:passenger, 32))
cargo_train.print_stations
cargo_train.move_station
cargo_train.print_stations
cargo_train.move_station
cargo_train.print_stations
another_cargo_train = CargoTrain.new('AS1231B')
another_cargo_train.take_route(route)
another_another_cargo_train = CargoTrain.new('AS1231C')
another_another_cargo_train.take_route(route)
passenger_train = PassengerTrain.new('AR1231P')
passenger_train.take_route(route)
train_block = proc { |x| x.to_s }
station_block = proc { |x| puts "Train #{x.number} #{x.iterate_carriages(&train_block)}" }
route_block = proc { |x| x.iterate_trains(&station_block) }
route.iterate_route(&route_block)

