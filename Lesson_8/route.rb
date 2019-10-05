class Route
  include InstanceCounter
  include Valid
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    validate!
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    @stations.delete(station)
  end

  def show_stations
    @stations.each.with_index(1) do |station, index|
      p "#{index}: #{station.name}"
    end
  end

  private

  def validate!
    raise 'Station must be different' if @stations.first == @stations.last
  end
end
