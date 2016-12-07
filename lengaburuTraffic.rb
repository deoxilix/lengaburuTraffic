Dir["./lib/**/*.rb"].each {|klass| require klass }
# require "./core/LengaburuMaps"
require 'pry'

class LengaburuTraffic

  def self.make_my_trip
    input = File.new("input.txt", "r")
    output = File.open('output.txt', 'w+')
    traffic_meta = []

    while(line = input.gets.strip)
      traffic_meta << line unless line.empty?
    end

    until traffic_meta.empty?
      current_weather = Weathers.find{|weather| weather.name == traffic_meta.shift.split(" ").last}
      LengaburuMaps.verify_vehicles (current_weather)

      LengaburuMaps::Available_orbits.count.times do
        meta = traffic_meta.shift.split(" ")
        LengaburuMaps::Available_orbits.find{|orbit| orbit.name == meta.first }.traffic_speed = meta.last.to_i
      end
    end
    binding.pry
  end
end

LengaburuTraffic.make_my_trip
