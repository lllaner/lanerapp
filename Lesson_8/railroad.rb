# frozen_string_literal: true

# Class railroad
class Railroad
  def initialize
    @trains = []
    @routes = []
    @stations = []
  end

  def menu
    loop do
      select_option
      puts menu_option
      general_methods = %w[create_station create_train create_route stations
                           trains routes]
      choose = user_choose
      send(general_methods[choose]) unless general_methods[choose].nil?
    end
  end

  private

  def render_menu(menu_option)
    menu_option.each { |option| p option }
  end

  def create_station
    p 'Please enter name station'
    name = gets.chomp
    @stations << Station.new(name)
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def create_train
    puts 'Please choose type of train'
    puts type_train
    choose = user_choose
    class_type = [PassengerTrain, CargoTrain]
    type = class_type[choose]
    begin
      p 'Please enter name of train'
      name = gets.chomp
      @trains << type.new(name)
    rescue RuntimeError => e
      puts e.message
      retry
    end
  end

  def create_route
    puts 'Please choosed first stations'
    first_station = choose_station
    puts 'Please choosed last stations'
    last_station = choose_station
    @routes << Route.new(first_station, last_station)
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def stations
    select_option
    puts station_options
    choose = gets.chomp.to_i
    render_object(@stations, :edit_station, 'show_stations') if choose == 1
  end

  def trains
    select_option
    puts train_options
    choose = gets.chomp.to_i
    render_object(@trains, :edit_train, 'show_trains') if choose == 1
  end

  def routes
    select_option
    puts route_options
    choose = gets.chomp.to_i
    render_object(@routes, :edit_route, 'show_routes') if choose == 1
  end

  def edit_train(train)
    puts edit_train_options
    case gets.chomp.to_i
    when 1 then train_car_add(train)
    when 2 then train.car_out
    when 3 then train.get_route(@routes[choosing_object('show_routes')])
    when 4 then train.send_next_station
    when 5 then train.send_previous_station
    when 6 then show_cars(train)
    end
  end

  def edit_car(car)
    puts edit_car_options
    case gets.chomp.to_i
    when 1
      puts 'Please input value'
      value = gets.chomp.to_i
      car.take_capacity(value)
    end
  end

  def train_car_add(train)
    puts 'Please input capacity of car'
    car = train.type_car.new(gets.chomp.to_i)
    train.car_add(car)
  end

  def edit_station(station)
    puts edit_station_options
    case gets.chomp.to_i
    when 1
      station.each_train do |train, index|
        puts "#{index}: #{train.name} , #{train.type}, #{train.current_cars}"
      end
    end
  end

  def edit_route(route)
    puts edit_route_options
    case gets.chomp.to_i
    when 1 then route.add_station(choose_station)
    when 2 then p remove_station(route)
    when 3 then routes
    end
  end

  def remove_station(route)
    route.show_stations
    p 'Please enter number of station from remove'
    choose = user_choose
    route.remove_station(route.stations[choose])
  end

  def choose_car(train)
    puts 'Please choose car'
    number = user_choose
    car = train.cars[number]
    puts car
    edit_car(car)
  end

  def choose_station
    @stations[choosing_object('show_stations')]
  end

  def render_object(object, edit, show_methods)
    number_object = choosing_object(show_methods)
    p object[number_object]
    send(edit, object[number_object])
  end

  def choosing_object(show_methods)
    send(show_methods)
    p 'Please enter number'
    user_choose
  end

  def select_option
    p 'Please select option'
  end

  # Show methods
  def show_stations
    @stations.each.with_index(1) do |station, index|
      p "#{index} - #{station.name}"
    end
  end

  def show_trains
    @trains.each.with_index(1) do |train, index|
      p "#{index} - #{train.name} : #{train.type}"
    end
  end

  def show_cars(train)
    train.each_cars do |car, index|
      puts "#{index} - type: #{car.class}, capacity: #{car.capacity}, occupied_capacity: \
      #{car.occupied_capacity}"
    end
    choose_car(train)
  end

  def show_routes
    @routes.each.with_index(1) do |route, index|
      puts "#{index} - from #{route.stations.first.name} to #{route.stations.last.name}"
    end
  end

  def user_choose
    gets.chomp.to_i - 1
  end

  def menu_option
    [
      '1 - Create station',
      '2 - Create train',
      '3 - Create route',
      '4 - Show stations',
      '5 - Show trains',
      '6 - Show routes'
    ]
  end

  def type_train
    [
      '1 - Passenger train',
      '2 -  Cargo train'
    ]
  end

  def route_options
    [
      '1 - Select route',
      '2 - Back'
    ]
  end

  def train_options
    [
      '1 - Select train',
      '2 - Back'
    ]
  end

  def station_options
    [
      '1 - Select station',
      '2 - Back'
    ]
  end

  def edit_train_options
    [
      '1 - Add car',
      '2 - Remove car',
      '3 - Add route',
      '4 - Move train next station',
      '5 - Move train back station',
      '6 - Show cars',
      '7 - Back'
    ]
  end

  def edit_car_options
    [
      '1 - Take capacity',
      '2 - Back'
    ]
  end

  def edit_station_options
    [
      '1 - Show trains on the station',
      '2 - Back'
    ]
  end

  def edit_route_options
    [
      '1 - Add stations',
      '2 - Remove stations',
      '3 - Back'
    ]
  end
end
