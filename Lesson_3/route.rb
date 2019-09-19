class Route

  attr_reader :stations

  def initialize(first_station,last_station)
    @stations = [first_station,last_station] 
  end
  
  def add_station(station)
    @stations.insert(-2,station)
  end

  def remove_station(station)
    @stations.delete(station)
  end

  def show_stations
    @stations.each.with_index(1){ |station,index| p "#{station}: #{station}" }
  end

end
