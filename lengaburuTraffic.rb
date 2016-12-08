Dir["./lib/**/*.rb"].each {|klass| require klass }
Dir["./core/**/*.rb"].each {|klass| require klass }

class LengaburuTraffic
  extend LengaburuMaps

  Vehicle_meta = [
    ["Bike", 10, 2, [Weather::Types::SUNNY, Weather::Types::WINDY]],
    ["TukTuk", 12, 1, [Weather::Types::SUNNY, Weather::Types::RAINY]],
    ["SuperCar", 20, 3, [Weather::Types::SUNNY, Weather::Types::WINDY, Weather::Types::RAINY]]
  ]
  Orbit_meta = [
    ["Orbit1", 18, 20],
    ["Orbit2", 20, 10]
  ]

  def self.make_my_trip
    input = File.new("input.txt", "r")
    output = File.open('output.txt', 'w+')
    traffic_meta = []

    while(line = input.gets)
      traffic_meta << line unless line.strip!.empty?
    end

    until traffic_meta.empty?
      self.create_all_vehicles
      self.create_all_orbits

      weather_meta = traffic_meta.shift.split(" ").last
      current_weather = Weather::Types::ALL.find{|weather| weather.name == weather_meta }
      LengaburuMaps.update_available_vehicles(current_weather)
      LengaburuMaps::Available_orbits.size.times{ LengaburuMaps.update_orbits(traffic_meta.shift.split(" "), current_weather) }

      output.write LengaburuMaps.eval
    end
  end

  def self.create_all_vehicles
    LengaburuMaps::Available_vehicles.clear
    Vehicle_meta.each do |meta|
      LengaburuMaps::Available_vehicles << Vehicle.new(*meta)
    end
    LengaburuMaps::Available_vehicles
  end

  def self.create_all_orbits
    Orbit_meta.each do |meta|
      LengaburuMaps::Available_orbits << Orbit.new(*meta)
    end
  end
end

LengaburuTraffic.make_my_trip
