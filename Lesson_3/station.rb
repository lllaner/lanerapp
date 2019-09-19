class Station
  attr_reader :name, :trains

  def initialize(name)
  @name = name
  @trains = []
  end

  def get_train(train)
    @trains << train
  end

  def show_trains
    trains
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_trains_by_type(type)
    trains.each { |train| p "#{train}" if train.type == type  }
  end

end
