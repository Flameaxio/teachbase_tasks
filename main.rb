# Importing classes
load './station.rb'
load './route.rb'
load './train.rb'

route = Route.new(Station.new('Перемога'), Station.new('Метробудiвникiв'))
route.add_station(Station.new('Олексіївська'))
route.add_station(Station.new('23-го серпня'))
route.add_station(Station.new('Ботанічний сад'))
route.add_station(Station.new('Наукова'))
route.add_station(Station.new('Держпром'))
route.add_station(Station.new('Архітектора Бекетова'))
route.add_station(Station.new('Захисників України'))
cargo_train = Train.new('AS1231A', :cargo, 1)
cargo_train.take_route(route)
cargo_train.add_car
cargo_train.speed_up(100)
cargo_train.add_car
puts "Number of cars:  #{cargo_train.number_of_cars}"
cargo_train.print_stations
cargo_train.move_station
cargo_train.print_stations
cargo_train.move_station
cargo_train.print_stations
another_cargo_train = Train.new('AS1231B', :cargo, 10)
another_cargo_train.take_route(route)
another_another_cargo_train = Train.new('AS1231C', :cargo, 10)
another_another_cargo_train.take_route(route)
passenger_train = Train.new('AR1231P', :passenger, 5)
passenger_train.take_route(route)
puts "All trains on station 1: #{route.starting_station.show_trains}"
puts "All trains on the last station: #{route.ending_station.show_trains}"
puts 'Cargo: '
route.starting_station.show_trains(:cargo)
puts 'Passenger: '
route.starting_station.show_trains(:passenger)
