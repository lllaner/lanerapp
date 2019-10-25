class PassengerTrain < Train
  validate :name, :presence
  validate :name, :type, String
  validate :name, :format, NUMBER_FORMAT
  attr_reader :type_car
  def initialize(name)
    super(name, self.class)
    @type_car = PassengerCar
  end

  def car_add(car)
    super(car) if car.class == type_car
  end
end
