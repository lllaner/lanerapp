class Station
  attr_reader :name, :trains
  include InstanceCounter
  @@instatnces = []

  def self.all
    @@instances
  end
  def initialize(name)
  @name = name
  @trains = []
  @@instances << self
  end

  def take_train(train)
    @trains << train
  end

  def show_trains
    trains.each.with_index(1) { |train,index| puts "#{index} - #{train.name}: #{train.class}" }

  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_trains_by_type(type)
    trains.each { |train| p "#{train}" if train.type == type  }
  end

end
