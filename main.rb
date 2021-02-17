# Importing classes
require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'passenger_carriage'
require_relative 'cargo_train'
require_relative 'cargo_carriage'
require_relative 'train_factory'

begin
  puts 'Enter the number of the train: '
  number = gets.chomp
  puts 'Enter the type of the train (passenger or cargo): '
  type = gets.chomp
  train = TrainFactory.get_train(number, type)
  puts "Created train: #{train}"
rescue ArgumentError => e
  puts e.message
  retry
end
