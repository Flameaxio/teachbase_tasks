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
    station = choose_station
    return puts 'Нет такой станции' unless station

    train = choose_train
    return puts 'Нет такого поезда' unless train

    station.accept_train(train)
    puts "Поезд #{train.number} успешно добавлен на станцию #{station.name}!"
  end

  def create_station
    puts 'Введите имя станции!'
    station_name = gets.chomp
    stations << Station.new(station_name)
    puts "Станция #{station_name} успешно создана!"
  end
end
