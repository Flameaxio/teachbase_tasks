class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
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

end
