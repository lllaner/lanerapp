# frozen_string_literal: true

# Class train
class Train
  include CreatedBy
  include InstanceCounter
  include Valid
  attr_reader :name, :type
  attr_accessor :cars, :speed

  @@trains = {}
  NUMBER_FORMAT = /^[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}/

  def self.find(name)
    @@trains[name]
  end

  def initialize(name, type)
    @name = name
    @type = type
    @cars = []
    validate!
    @@trains[@name] = self
    @speed = 0
  end

  def speed_up(speed)
    @speed = speed
  end

  def current_speed
    @speed
  end

  def train_stop
    @speed = 0
  end

  def current_cars
    @cars.size
  end

  def car_add(car)
    @cars << car if @speed.zero?
  end

  def car_out
    @cars.delete(cars.last)
  end

  def get_route(route)
    @route = route
    @route.stations.first.take_train(self)
    @position = 0
  end

  def current_station
    @route.stations[@position]
  end

  def next_station
    if last_station?
    else
      @route.stations[@position + 1]
    end
  end

  def previous_station
    if first_station?
    else
      @route.stations[@position - 1]
    end
  end

  def send_next_station
    if @route != nil && @route.stations.last != current_station
      current_station.send_train(self)
      next_station.take_train(self)
      @position += 1
    end
  end

  def send_previous_station
    if @route != nil && @route.stations.first != current_station
      current_station.send_train(self)
      previous_station.take_train(self)
      @position -= 1
    end
  end
  # => Before it is use only into programm, don't  use outside programm

  private

  def validate!
    raise 'This is not right format for name' if name !~ NUMBER_FORMAT
  end

  def last_station?
    @route.stations.last == current_station
  end

  def first_station?
    @route.stations.first == current_station
  end
end
