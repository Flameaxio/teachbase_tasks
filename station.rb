class Station

  def initialize(name)
    @name = name
    @trains = []
  end

  def accept_train(train)
    @trains.push(train)
  end

  def show_trains(type = 0)
    puts @trains.select do |x|
      type.zero? ? x : x.type == type
    end
  end

  def send_train(train)
    @trains.delete(train)
  end

end
