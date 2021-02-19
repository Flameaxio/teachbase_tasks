module CarriageActions
  include(TrainActions)

  def choose_carriage
    train = choose_train
    puts train
    i = 0
    train.iterate_carriages do |carriage|
      puts "#{i += 1}: #{carriage}"
      puts 'Choose carriage by number'
      carriage_index = gets.chomp.to_i
      carriage = train.carriages[carriage_index - 1]
      take_place_or_volume(carriage)
    end
  end

  def take_place_or_volume(carriage)
    case carriage.type
    when :PassengerCarriage
      take_place(carriage)
    when :CargoCarriage
      take_volume(carriage)
    else
      raise ArgumentError
    end
  end

  def take_place(carriage)
    carriage.occupy_seat
    puts 'Вы заняли 1 место'
  end

  def take_volume(carriage)
    puts "Введите обьем который хотите занять! Свободно: #{carriage.free_space}"
    volume = gets.chomp.to_i
    if carriage.free_space > volume
      carriage.load_cargo(volume)
      puts "Вы заняли обьем #{volume}"
    else
      puts 'Вы не можете занять столько обьема'
    end
  end

  def remove_carriage
    train = choose_train
    if train.remove_carriage
      puts 'Вагон успешно отцеплен'
    else
      puts 'В поезде нет вагонов'
    end
  end

  def add_carriage
    train = choose_train
    return unless train

    case train.type.to_sym
    when :PassengerTrain
      add_passenger_carriage(train)
    when :CargoCarriage
      add_cargo_carriage(train)
    else
      puts 'Wrong type'
    end
  end

  def add_passenger_carriage(train)
    puts 'Введите количество мест'
    seats = gets.chomp.to_i
    train.add_carriage(PassengerCarriage.new(:PassengerCarriage, seats))
  end

  def add_cargo_carriage(train)
    puts 'Введите обьем'
    volume = gets.chomp.to_i
    train.add_carriage(CargoCarriage.new(:PassengerCarriage, volume))
  end
end
