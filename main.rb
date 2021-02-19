require_relative 'trains/train'
require_relative 'route'
require_relative 'station'
require_relative 'carriages/carriage'
require_relative 'carriages/cargo_carriage'
require_relative 'trains/cargo_train'
require_relative 'carriages/passenger_carriage'
require_relative 'trains/passenger_train'
require_relative 'modules/validation'
require_relative 'modules/train_actions'
require_relative 'modules/carriage_actions'
require_relative 'modules/station_actions'

# Text UI
class Main
  include(TrainActions)
  include(CarriageActions)
  include(StationActions)

  ACTIONS = {
    1 => :create_station,
    2 => :choose_train_type,
    3 => :add_carriage,
    4 => :remove_station,
    5 => :add_train_to_station,
    6 => :trains_on_station,
    7 => :choose_carriage
  }.freeze
  attr_reader :stations, :trains

  def initialize
    @stations = []
    @trains = []
  end

  def text_ui
    loop do
      action = choose_action
      break if action.zero?

      send(ACTIONS[action])
    end
  end

  private

  attr_writer :stations, :trains

  def choose_train_type
    puts 'Введите тип поезда который хотите создать!
      1 - Пасажирский
      2 - Товарный
    '
    train_type = gets.chomp.to_i
    create_train(train_type)
  end

  def trains_list(type = nil)
    if type
      trains.map { |t| t.number if t.type == type }.compact.join(' ')
    else
      trains.map(&:number).join(' ')
    end
  end

  def choose_action
    puts "Список действий\n0 - Выход\n1 - Создавать станции\n2 - Создавать поезда
3 - Добавлять вагоны к поезду
4 - Отцеплять вагоны от поезда
5 - Помещать поезда на станцию
6 - Просматривать список станций и список поездов на станции
7 - Занять место или обьем в вагоне
ВВЕДИТЕ НОМЕР:"
    gets.chomp.to_i
  end
end

Main.new.text_ui
