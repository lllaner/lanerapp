class Station
  attr_reader :name, :trains
  include InstanceCounter
  include Validation

  NAME_FORMAT = /[a-z0-9]/.freeze

  @@instances = []

  def self.all
    @@instances
  end
  validate :name, :format, NAME_FORMAT
  validate :name, :presence
  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@instances << self
  end

  def take_train(train)
    @trains << train
  end

  def each_train
    @trains.each.with_index(1) { |train, index| yield(train, index) }
  end

  def show_trains
    trains.each.with_index(1) { |train, index| puts "#{index} - #{train.name}: #{train.class}" }
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_trains_by_type(type)
    trains.each { |train| p train.to_s if train.type == type }
  end
end
