module TrainActions

  def trains_on_station
    station = choose_station
    return puts 'Нет такой станции' unless station

    puts "Список поездов на станции #{station.name}:"
    station_info(station)
  end

  def choose_station
    puts "Список станций: #{stations_list}"
    puts 'Введите имя станции'
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
    puts "Список поездов: #{trains_list}"
    puts 'Введите номер поезда'
    train_number = gets.chomp
    train_by_number(train_number)
  end

  def train_by_number(number)
    Train.find(number)
  end

  def create_train(train_type)
    puts 'Введите номер поезда'
    train_number = gets.chomp
    case train_type
    when 1
      create_passenger_train(train_number)
    when 2
      create_cargo_train(train_number)
    else
      'Не верный выбор'
    end
  end

  def create_passenger_train(train_number)
    trains << PassengerTrain.new(train_number)
    puts "Пасажирский поезд успешно создан c номером #{train_number}!"
  end

  def create_cargo_train(train_number)
    trains << CargoTrain.new(train_number)
    puts "Грузовой поезд успешно создан c номером #{train_number}!"
  end
end
