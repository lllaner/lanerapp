class Station
  attr_reader :name, :trains
  include InstanceCounter
  @@instances = []
  NAME_FORMAT =  /^[a-z0-9]/

  def self.all
    @@instances
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@instances << self
  end

  def validate!
    raise 'This is not right format' if name !~ NAME_FORMAT
  end

  def valid?
    validate!
  rescue
    false
  end

  def take_train(train)
    @trains << train
  end

  def show_trains
    trains.each.with_index(1) { |train, index| puts "#{index} - #{train.name}: #{train.class}" }
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_trains_by_type(type)
    trains.each { |train| p "#{train}" if train.type == type }
  end
end
