# frozen_string_literal: true

# Actions regarding carriages
module CarriageActions
  include(TrainActions)

  def choose_carriage
    train = choose_train
    puts train
    take_place_or_volume(list_carriages(train))
  end

  def list_carriages(train)
    i = 0
    train.iterate_carriages do |carriage|
      puts "#{i += 1}: #{carriage}"
      puts 'Choose carriage by number'
      carriage_index = gets.chomp.to_i

      return train.carriages[carriage_index - 1]
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
    puts 'You\'ve took one place'
  end

  def take_volume(carriage)
    puts "Enter the amount of volume you want to take! Free: #{carriage.free_space}"
    volume = gets.chomp.to_i
    if carriage.free_space > volume
      carriage.load_cargo(volume)
      puts "You've taken #{volume}"
    else
      puts 'You cannot take this much space'
    end
  end

  def remove_carriage
    train = choose_train
    remove(train)
  end

  def remove(train)
    carriage = list_carriages(train)
    if train.remove_carriage(carriage)
      puts 'Carriage was successfully removed'
    else
      puts 'There are no carriages in this train'
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
    puts 'Enter the amount of places'
    seats = gets.chomp.to_i
    train.add_carriage(PassengerCarriage.new(:PassengerCarriage, seats))
    puts 'Success!'
  end

  def add_cargo_carriage(train)
    puts 'Enter the volume'
    volume = gets.chomp.to_i
    train.add_carriage(CargoCarriage.new(:CargoCarriage, volume))
    puts 'Success!'
  end
end
