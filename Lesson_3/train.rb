class Train

  attr_reader :name, :type
  attr_accessor :number_cars, :speed

  def initialize(name,type,number_cars)
    @name = name
    @type = type
    @number_cars = number_cars
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
    @number_cars
  end

  def car_add
    @number_cars += 1 if @speed == 0 
  end

  def car_out
    @number_cars -= 1 if @speed == 0 && number_cars > 0
  end

  def get_route(route)
    @route = route
    @route.stations.first.get_train(self)
    @position = 0
  end

  def current_station()
    @route.stations[@position]
  end

  def next_station
    if @route.stations.last == current_station
      p "Station is last"
    else
      @route.stations[@position + 1]
    end
  end

  def previous_station
    if @route.stations.first == current_station
      p "Station is first"
    else
      @route.stations[@position - 1]
    end
  end

  def send_next_station
    if @route != nil && @route.stations.last != current_station
      current_station.send_train(self)
      next_station.get_train(self)
      @position += 1
    end 
  end

  def send_previous_station
    if @route != nil && @route.stations.first != current_station
      current_station.send_train(self)
      previous_station.get_train(self)
      @position -= 1
    end 
  end

end
