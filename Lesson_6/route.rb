class Route
  include InstanceCounter
  
  attr_reader :stations

  def initialize(first_station, last_station)
    validate!(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    @stations.delete(station)
  end

  def validate!(first_station, last_station)
    raise 'Station must be different' if first_station == last_station
  end

  def valid?
    validate!
  rescue
    false
  end

  def show_stations
    @stations.each.with_index(1) { |station, index| p "#{index}: #{station.name}" }
  end

end
