# frozen_string_literal: true

# Actions regarding stations
module StationActions
  def station_info(station)
    station.iterate_trains do |train|
      puts "Number: #{train.number}, Type: #{train.type}, Carriages: #{train.carriages.count}"
      i = 1
      train.iterate_carriages do |carriage|
        puts "#{i}: #{carriage.info}"
        i += 1
      end
    end
  end

  def add_train_to_station
    train = choose_train
    return puts 'There is no such train' unless train

    if !@route.nil?
      train.take_route(@route)
      puts "Train #{train.number} was successfully put on #{@route.stations.first.name}!"
    else
      puts 'Route is too short'
    end
  end

  def create_station
    puts 'Enter the name of the station!'
    station_name = gets.chomp
    stations << Station.new(station_name)
    self.route = Route.new(*stations) if stations.size > 1
    puts "Station #{station_name} was successfully created!"
  end
end
