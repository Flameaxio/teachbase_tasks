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
    @trains.push(train)
  end

  def show_trains(type = nil)
    current_trains = @trains.select do |x|
      type.nil? ? x : x.class.to_s == type.to_s
    end
    current_trains.each do |x|
      puts x.number
    end
  end

  def send_train(train)
    @trains.delete(train)
  end

  def iterate_trains(&block)
    @trains.each(&block)
  end

end
