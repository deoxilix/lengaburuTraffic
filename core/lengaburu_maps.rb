=begin

  LengaburuMaps is an abstraction majorly wrapping Orbits and Vehicles,

  while being rooted into the Lengaburu_Traffic_Controller, updates itself with realtime information,

  when regulated by the Lengaburu_Traffic_Controller it can deduce the Fastest_Vehicle_Orbit_Pairs,

  thereby solving the fundamental problem of LengaburuTraffic.

=end

module LengaburuMaps
  Available_vehicles = []
  Available_orbits = []
  FastestVehicleOrbitPair = Hash.new() {|h,k| h[k] = [] }


  Vehicle_Precedence = [
    "Bike",
    "TukTuk",
    "SuperCar"
  ]

  def LengaburuMaps.evaluate
    record_vehicle_orbit_time
    evaluate_preffered_pair( evaluate_fastest_pair )
    display
  end

=begin

  LengaburuMaps.update_available_vehicles, updates the vehicles list available to LengaburuMaps,
  in the given Weather conditions.

=end

  def LengaburuMaps.update_available_vehicles (current_weather)
    Available_vehicles.select!{|vehicle| vehicle.viable_weathers.include? (current_weather) }
  end

=begin

  LengaburuMaps.update_orbits updates all the Orbits'
    :traffic_speed => from realtime input data
    :craters => from given weather conditions

=end

  def LengaburuMaps.update_orbits (orbit_meta, current_weather)
    Available_orbits.find{|orbit| orbit.name == orbit_meta.first }.traffic_speed = orbit_meta[-2].to_i
    Available_orbits.each{|orbit| orbit.weathering (current_weather) }
  end

  private

=begin

  Calculates time required for each Vehicle:Orbit pair
  And saves it into a hash: for later evaluation_of_fastest_pair

=end

  def self.record_vehicle_orbit_time
    FastestVehicleOrbitPair.clear

    Available_orbits.each{|orbit|
      Available_vehicles.each{|vehicle|
        FastestVehicleOrbitPair[ vehicle.estimate_trip_time(orbit) ] << ([] << orbit.name << vehicle.name)
      }
    }
  end

=begin
=end

  def self.evaluate_fastest_pair
    lowest_time = FastestVehicleOrbitPair.min.first
    FastestVehicleOrbitPair.select!{|time| time == lowest_time }
    lowest_time
  end

  def self.evaluate_preffered_pair(lowest_time)
    if FastestVehicleOrbitPair.first.last.size > 1
      FastestVehicleOrbitPair[lowest_time].sort_by!{|combination| Vehicle_Precedence.index(combination.last) }
    end

    FastestVehicleOrbitPair[lowest_time] = FastestVehicleOrbitPair[lowest_time].shift
  end

  def self.display
    time, pair = FastestVehicleOrbitPair.first
    "Vehicle #{pair.last} on #{pair.first}, ETA: #{time} hours.\n"
  end
end
