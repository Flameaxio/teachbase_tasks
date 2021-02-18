class Station
  attr_reader :name

  @@all_stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations.push(self)
  end

  def valid?
    raise ArgumentError, "Name can't be nil" if @name.nil?

    true
  end

  def self.all
    @@all_stations
  end

  def accept_train(train)
    unless train.is_a? Train
      puts 'Wrong input'
      return false
    end
    @trains.push(train)
  end

  def show_trains(type = nil)
    current_trains = @trains.select do |x|
      type.nil? ? x : x.type == type
    end
    return 'There are no trains' if current_trains.empty?

    current_trains.map(&:to_s)
  end

  def send_train(train)
    return 'There are no trains' if @trains.empty?

    @trains.delete(train)
  end

end
