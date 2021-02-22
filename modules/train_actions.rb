# frozen_string_literal: true

# Actions regarding trains
module TrainActions
  def trains_on_station
    station = choose_station
    return puts 'There is no such station' unless station

    puts "The list of the stations on the #{station.name}:"
    station_info(station)
  end

  def choose_station
    puts "List of stations: #{stations_list}"
    puts 'Enter the name of the station'
    station_name = gets.chomp
    station_by_name(station_name)
  end

  def stations_list
    stations.map(&:name).join(' ')
  end

  def station_by_name(name)
    stations.select { |station| station.name == name }.first
  end

  def choose_train
    puts "List of the trains: #{trains_list}"
    puts 'Enter the number of the train'
    train_number = gets.chomp
    train = train_by_number(train_number)
    raise 'No such train' if train.nil?

    train
  end

  def train_by_number(number)
    Train.find(number)
  end

  def create_train(train_type)
    puts 'Enter the number of the train'
    train_number = gets.chomp
    case train_type
    when 1
      create_passenger_train(train_number)
    when 2
      create_cargo_train(train_number)
    else
      'Not correct choice'
    end
  end

  def create_passenger_train(train_number)
    trains << PassengerTrain.new(train_number)
    puts "Passenger train was created with number #{train_number}!"
  end

  def create_cargo_train(train_number)
    trains << CargoTrain.new(train_number)
    puts "Cargo train was created with number #{train_number}!"
  end

  def control_train
    train = choose_train
    puts train
    action = choose_train_action
    perform_action(action, train)
  end

  def choose_train_action
    puts '1 - Speed up by 10'
    puts '2 - Speed down by 10'
    puts '3 - Move to the next station'
    gets.chomp.to_i
  end

  def perform_action(action, train)
    case action
    when 1
      train.speed_up(10)
    when 2
      train.speed_down(10)
    when 3
      puts train.move_station
    else
      puts 'Wrong action'
    end
  end
end
