Dir["./models/**/*.rb"].each {|klass| require klass }
Dir["./core/**/*.rb"].each {|klass| require klass }

require "pry"

class LengaburuTrafficController
  extend LengaburuMaps

  @@available_vehicles = []
  @@available_orbits = []
  @@weathers = []



  def self.make_my_trip
    input = File.new("input.txt", "r")
    output = File.open('output.txt', 'w+')

    traffic_meta = []
    while(line = input.gets)
      traffic_meta << line unless line.strip!.empty?
    end

    self.create_weathers
    self.create_all_vehicles(*@@weathers)

    until traffic_meta.empty?
      self.create_all_orbits

      weather_meta = traffic_meta.shift.split(" ").last
      current_weather = @@weathers.find{|weather| weather.name == weather_meta }

      update_vehicle_availability(@@available_vehicles, current_weather)
      @@available_orbits.size.times{ update_orbit(@@available_orbits, traffic_meta.shift.split(" "), current_weather) }


      output.write ( LengaburuMaps.evaluate(@@available_vehicles, @@available_orbits) + "\n" )
    end
  end




  private
  def self.create_weathers
    weather_meta = [
      ["Sunny", 0.9],
      ["Windy", 1.0],
      ["Rainy", 1.1]
    ]

    weather_meta.each do |meta|
      @@weathers << Weather.new(*meta)
    end
  end




  def self.create_all_vehicles(sunny_weather, windy_weather, rainy_weather)
    @@available_vehicles.clear

    vehicle_meta = [
    ["Bike", 10, 2, [sunny_weather, windy_weather]],
    ["TukTuk", 12, 1, [sunny_weather, rainy_weather]],
    ["SuperCar", 20, 3, [sunny_weather, windy_weather, rainy_weather]]
    ]

    vehicle_meta.each do |meta|
      @@available_vehicles << Vehicle.new(*meta)
    end
  end




  def self.create_all_orbits
    @@available_orbits.clear

    orbit_meta = [
      ["Orbit1", 18, 20],
      ["Orbit2", 20, 10]
    ]

    orbit_meta.each do |meta|
      @@available_orbits << Orbit.new(*meta)
    end
  end

end

LengaburuTrafficController.make_my_trip
