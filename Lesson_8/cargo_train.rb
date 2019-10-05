# frozen_string_literal: true

class CargoTrain < Train
  attr_reader :type_car
  def initialize(name)
    super(name, self.class)
    @type_car = CargoCar
  end

  def car_add(car)
    super(car) if car.class == type_car
  end
end
