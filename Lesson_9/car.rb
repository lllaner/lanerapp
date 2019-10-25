class Car
  include CreatedBy
  attr_reader :capacity
  attr_reader :occupied_capacity

  def initialize(capacity)
    @capacity = capacity
    @occupied_capacity = 0
  end

  def take_capacity(capacity)
    @occupied_capacity += capacity if capacity + @occupied_capacity < @capacity
  end

  def free_capacity
    @capacity - @occupied_capacity
  end
end
